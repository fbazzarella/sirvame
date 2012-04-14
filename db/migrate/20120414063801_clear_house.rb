class ClearHouse < ActiveRecord::Migration
  def up
  	drop_table :searches
  	drop_table :companies
  	drop_table :tags
  	drop_table :taggings
  	drop_table :sessions
  end

  def down
  end
end