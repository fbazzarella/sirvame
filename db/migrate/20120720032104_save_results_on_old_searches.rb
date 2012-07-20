class SaveResultsOnOldSearches < ActiveRecord::Migration
  def up
    Search.all.each do |search|
      search.companies = Company.search(search.word_list.join(' '))
    end
  end

  def down
    Search.all.each do |search|
      search.companies.clear
    end
  end
end