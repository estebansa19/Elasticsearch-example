class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string :name
      t.text :description
      t.string :author
      t.decimal :price
      t.string :duration

      t.timestamps
    end
  end
end
