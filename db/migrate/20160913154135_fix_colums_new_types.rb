class FixColumsNewTypes < ActiveRecord::Migration
  def change
    change_column :products, :proprietes,  :string
  end
end
