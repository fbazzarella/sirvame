class RemoveTermsFromSearch < ActiveRecord::Migration
  def up
    remove_column :searches, :terms
  end

  def down
    add_column :searches, :terms, :string
  end
end