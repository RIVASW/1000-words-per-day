#
class Word < ActiveRecord::Base
  belongs_to :language

  def translations
    Translation.where('foreign_word=? OR translation_word=?', id, id)
  end
end
