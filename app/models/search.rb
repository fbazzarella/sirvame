class Search < ActiveRecord::Base
	has_and_belongs_to_many :companies
	
	attr_accessible :word_list

	validates :word_list, presence: true

	acts_as_taggable_on :words

	def self.perform_with(word_list = nil)
		if word_list
			create word_list: word_list.gsub(/\s/, ', ')

	    Company.search(word_list).order('plan DESC', 'tsrank DESC', :name).all
		else
			# TODO need more inteligence here
			companies = Company.where(plan: 'plus').order(:name).all
			companies + Company.random(12 - companies.size)
		end.compact.uniq
	end
end