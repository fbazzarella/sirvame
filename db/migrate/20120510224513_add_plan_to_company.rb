class AddPlanToCompany < ActiveRecord::Migration
  def up
    add_column :companies, :plan, :string
    Company.update_all(plan: 'none')
  end

  def down
    remove_column :companies, :plan
  end
end