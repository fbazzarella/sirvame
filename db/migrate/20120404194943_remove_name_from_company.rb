class RemoveNameFromCompany < ActiveRecord::Migration
  def change
  	remove_column :companies, :name
  end
end