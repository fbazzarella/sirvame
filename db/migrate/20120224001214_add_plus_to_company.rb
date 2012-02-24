class AddPlusToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :plus, :boolean, null: false, default: false
  end
end
