class MoveTermsToTags < ActiveRecord::Migration
  def up
    Search.all.each do |search|
      search.word_list = search.terms.gsub(/\s/, ', ')
      search.save
    end
  end

  def down
    Search.all.each do |search|
      search.terms = search.word_list.join(' ')
      search.save
    end
  end
end
