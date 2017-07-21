class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.belongs_to :foreign_word, index: true
      t.belongs_to :translation_word, index: true
      t.belongs_to :translations_list, index: true

      t.timestamps
    end
  end
end
