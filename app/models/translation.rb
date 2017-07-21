class Translation < ActiveRecord::Base
  belongs_to :foreign_word, class_name: 'Word'
  belongs_to :translation_word, class_name: 'Word'
  belongs_to :translations_list
end

