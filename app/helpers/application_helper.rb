# encoding: utf-8
module ApplicationHelper
  def page_title
    'Encontre o que precisa - Sirva.me'
  end

  def normalize_search_params(search_params = nil)
  	search_params.gsub(/,|\s|\++/i, '+').gsub(/\++/i, ', ') unless search_params.nil?
  end
end