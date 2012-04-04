# encoding: utf-8
class Search < ActiveRecord::Base
	attr_accessible :term_list
	validates :term_list, presence: true
	acts_as_taggable_on :terms

	class << self
		def filter_terms(terms = nil)
			(terms || []) - %w(da de do)
		end
	end
end