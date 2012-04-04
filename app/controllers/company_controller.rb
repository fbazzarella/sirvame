class CompanyController < ApplicationController
  def index
  	@companies = if search_params = params[:encontrar].try(:split, %r{,|\s|\++})
  		name_query = ''
  		search_params.each_with_index do |sp, i|
  			name_query << " #{'or' if i > 0} lower(name) like '%#{sp.downcase}%'" unless sp.blank?
  		end
  		Company.where(name_query).all + Company.tagged_with(search_params, any: true, wild: true).all
  	else
  		Company.random(9)
  	end.uniq

  	respond_to do |f|
  		f.html
  		f.js { render partial: 'search_results' }
  	end
  end
end