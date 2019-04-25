class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.jsonb :preferences, null: false, default: '{}'

      t.timestamps
    end
    add_index  :users, :preferences, using: :gin
  end
end
