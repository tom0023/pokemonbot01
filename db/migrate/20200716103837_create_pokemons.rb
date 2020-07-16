class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.text :name
      t.text :type
      t.text :h
      t.text :a
      t.text :b
      t.text :c
      t.text :d
      t.text :s
      t.text :weak
      t.text :ability
      t.timestamps
    end
  end
end
