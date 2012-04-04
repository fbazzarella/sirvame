# encoding: utf-8
class Search < ActiveRecord::Base
	attr_accessible :term_list
	validates :term_list, presence: true
	acts_as_taggable_on :terms
end