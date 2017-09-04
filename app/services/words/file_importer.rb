require 'csv'

module Words
  class FileImporter
    HEADERS = ['Word', 'Translation'].freeze

    class WrongLanguageName < StandardError
      def initialize(language_name)
        super("Can not find the language with the given name: #{language_name}")
      end
    end

    class WrongHeader < StandardError
      def initialize(headers)
        correct_headers = HEADERS.join(', ')
        super("One or more headers are wrong, you have: #{headers}, should be: #{correct_headers}")
      end
    end

    def initialize(from_language_name:, to_language_name:, list_name:)
      @from_language = Language.find(name: from_language_name)
      @to_language = Language.find(name: to_language_name)
      @translations_list = TranslationsList.new(name: list_name)
      name_language_pairs = [[from_language_name, from_language], [to_language_name, to_language]]
      not_found_language_name = languge_name_unable_to_find(name_language_pairs)

      raise WrongLanguageName.new(not_found_language_name) if not_found_language_name.present?
    end

    def import(csv_file_name)
      csv_data = CSV.read(csv_file_name, headers: true)

      check_csv_headers!(csv_data.headers)
      csv_data.each { |row| import_word_translation_pair(row.to_h) }
    end

    private:

    def import_word_translation_pair(word:, traslation:)
      foreign_word = Word.new(word_text: word, Language: @from_language)
      translation_word = Word.new(word_text: traslation, Language: @to_language)
      Traslation.new(
                      foreign_word: foreign_word,
                      translation_word: translation_word,
                      translations_list: @translations_list
                    )
    end

    def languge_name_unable_to_find(name_language_pairs)
      name_language_pairs.map{ |a| a[0] if a[1].nil? }.compact.detect(&:present?)
    end

    def check_csv_headers!(headers)
      wrong_header = headers.any?{ |header| !HEADERS.include?(header) }
      wrong_header_number = HEADERS.count != headers.count

      raise WrongHeader(headers) if wrong_header || wrong_header_number
    end
  end
end
