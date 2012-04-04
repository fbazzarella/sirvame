# encoding: utf-8
module ApplicationHelper
  def page_title
    'Encontre o que precisa - sirva.me'
  end

  def normalize_search_params(search_params)
  	search_params.gsub(/,|\s|\++/i, '+').gsub(/\++/i, ', ')
  end
end