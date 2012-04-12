# encoding: utf-8
class Company < ActiveRecord::Base
	attr_accessible :name_list, :phone, :address, :segment_list, :product_list, :plus, as: :admin
	validates :name_list, :phone, :segment_list, presence: true
	acts_as_taggable_on :names, :segments, :products

	def evaluate_relevance_based_on(terms, relevance = 0)
		terms = terms.downcase.split(', ')
		{names: 3, segments: 1, products: 2}.each do |context, weight|
			relevance -= (prepare_context(try(context)) & terms).count * weight
		end
		relevance -= 100 if plus
		relevance
	end

	private
		def prepare_context(context)
			context.map(&:name).join('+').downcase.gsub(/\s+/i, '+').split('+')
		end
end