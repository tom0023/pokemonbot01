class RemoveWeakFromPokemons < ActiveRecord::Migration[6.0]
  def change
    remove_column :pokemons, :weak, :text
  end
end
