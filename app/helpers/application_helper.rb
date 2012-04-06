# encoding: utf-8
module ApplicationHelper
  def page_title
    'Encontre o que precisa em Valença - Sirva.me'
  end

  def normalize_search_params(params = nil)
  	return nil if params.nil?

		params = params.gsub(/,|\s|\++/i, '+').split('+') - ['']
		params.any? ? params.join(', ') : nil
  end
end