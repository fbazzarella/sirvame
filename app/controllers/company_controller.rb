class CompanyController < ApplicationController
  def index
  	@companies = if search_params = params[:encontrar].try(:split, %r{,|\s|\++})
      Company.tagged_with(search_params, any: true, wild: true).all
  	else
  		Company.random(9)
  	end.uniq

  	respond_to do |f|
  		f.html
  		f.js { render partial: 'search_results' }
  	end
  end
end