class FixProprietesType < ActiveRecord::Migration
  def change
    change_column :products, :proprietes, :string
  end
end
