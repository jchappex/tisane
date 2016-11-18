class FixNomlatinType < ActiveRecord::Migration
  def change
    change_column :products, :proprietes,  :int
  end
end
