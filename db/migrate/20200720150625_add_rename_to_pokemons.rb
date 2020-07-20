class AddRenameToPokemons < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :rename, :text
  end
end
