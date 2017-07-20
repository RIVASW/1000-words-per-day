class CreateTranslationsLists < ActiveRecord::Migration
  def change
    create_table :translations_lists do |t|

      t.timestamps
    end
  end
end
