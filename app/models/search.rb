# encoding: utf-8
class Search < ActiveRecord::Base
	attr_accessible :term_list
	validates :term_list, presence: true
	acts_as_taggable_on :terms

	class << self
		def bring_me_results_for(term_list = nil)
			if filtered_terms = filter_terms(term_list)
				create({term_list: filtered_terms})
				Company.tagged_with(filtered_terms.split(', '), any: true, wild: true).all
			else
				Company.random(12)
			end
		end

		def filter_terms(terms = nil)
			terms = terms.try(:split, ', ')
			terms ? (terms - %w(e da das de do dos)).join(', ') : nil
		end
	end
end