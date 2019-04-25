class CreateUserFields < ActiveRecord::Migration[5.2]
  def change
    create_table :user_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.boolean :unique
      t.decimal :max_value
      t.decimal :min_value
      t.string :field_hint
      t.string :field_name

      t.timestamps
    end
  end
end
