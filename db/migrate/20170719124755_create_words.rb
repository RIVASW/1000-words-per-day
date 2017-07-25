class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word_text
      t.belongs_to :language, index: true

      t.timestamps
    end
  end
end
