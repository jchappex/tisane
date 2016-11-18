class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :products, :type, :product_line
  end
end
