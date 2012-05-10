class RemovePlusFromCompany < ActiveRecord::Migration
  def up
    remove_column :companies, :plus
  end

  def down
    add_column :companies, :plus, :boolean, default: false
  end
end