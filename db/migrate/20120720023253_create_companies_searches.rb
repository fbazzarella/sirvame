class CreateCompaniesSearches < ActiveRecord::Migration
  def change
    create_table :companies_searches, id: false do |t|
      t.references :company
      t.references :search
    end
  end
end