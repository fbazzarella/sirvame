class CompanyController < ApplicationController
  def index
  	@companies = Company.limit(rand(30)).sort_by{rand}

  	respond_to do |f|
  		f.html
  		f.js { render partial: 'search_results' }
  	end
  end
end