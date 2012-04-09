# encoding: utf-8
class Search < ActiveRecord::Base
	attr_accessible :term_list
	validates :term_list, presence: true
	acts_as_taggable_on :terms

	class << self
		def bring_me_results_for(term_list = nil)
			if term_list = filter_terms(term_list)
				create(term_list: term_list)

				Company.tagged_with(
					term_list.split(', '), any: true, wild: true
				).sort_by do |company|
					company.evaluate_relevance_based_on(term_list)
				end
			else
				Company.random(12)
			end
		end

		private
			def filter_terms(terms = nil)
				(terms = terms.try(:split, ', ')) ? (terms - %w(e da das de do dos)).join(', ') : nil
			end
	end
end