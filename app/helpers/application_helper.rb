# encoding: utf-8
module ApplicationHelper
  def page_title
    'Encontre o que precisa - Sirva.me'
  end

  def normalize_search_params(params = nil)
  	params.gsub(/,|\s|\++/i, '+').gsub(/\++/i, ', ') unless params.nil?
  end
end