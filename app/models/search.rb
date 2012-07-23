class Search < ActiveRecord::Base
	has_and_belongs_to_many :companies

	attr_accessible :word_list, :companies, as: :search

	validates :word_list, presence: true

	acts_as_taggable_on :words

	def self.perform_with(word_list = nil)
		if word_list
	    results = Company.search(word_list).order('plan DESC', 'relevance DESC', :name).all
			create({word_list: word_list.gsub(/\s/, ', '), companies: results}, as: :search)
			results
		else
			companies = Company.where(plan: 'plus').order(:name).all
			companies + Company.random(12 - companies.size)
		end.compact.uniq
	end
end