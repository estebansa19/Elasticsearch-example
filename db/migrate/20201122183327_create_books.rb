class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :pages, null: false
      t.string :author, null: false
      t.decimal :price, precision: 16, scale: 3, default: 0.0, null: false

      t.timestamps
    end
  end
end
