class AddNomLatinToProduct < ActiveRecord::Migration
  def change
    add_column :products, :nomlatin, :char
    add_column :products, :provenance, :char
    add_column :products, :proprietes, :char
  end
end
