class Search < ActiveRecord::Base
	has_and_belongs_to_many :companies

	attr_accessible :word_list, :companies, as: :search

	validates :word_list, presence: true

	acts_as_taggable_on :words

	def self.perform_with(word_list = nil)
		if word_list
	    results = Company.search(word_list).order('plan DESC', 'relevance DESC', :name)

			create({word_list: word_list.gsub(/\s/, ', '), companies: results}, as: :search)

			results
		else
			Company.all_to_home.order('plan DESC', 'popularity DESC', :name)
		end
	end
end