class AddPlanToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :plan, :string
  end
end