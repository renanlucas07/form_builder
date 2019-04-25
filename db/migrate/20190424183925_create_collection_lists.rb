class CreateCollectionLists < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_lists do |t|
      t.string :name
      t.belongs_to :user_field, foreign_key: true

      t.timestamps
    end
  end
end
