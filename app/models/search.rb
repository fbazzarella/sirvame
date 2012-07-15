class Search < ActiveRecord::Base
	attr_accessible :terms
	validates :terms, presence: true

	def self.perform_with(term_list = nil)
		if term_list
			create terms: term_list

	    Company.search(term_list).order('plan DESC', 'tsrank DESC', :name).all
		else
			# TODO need more inteligence here
			companies = Company.where(plan: 'plus').order(:name).all
			companies + Company.random(12 - companies.size)
		end.compact.uniq
	end
end