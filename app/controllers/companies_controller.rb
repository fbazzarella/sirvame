class CompaniesController < ApplicationController
  def index
    search_params = normalize_search_params params[:encontrar]
    @companies    = Search.bring_me_results_for search_params

  	respond_to do |f|
  		f.html
  		f.js   { render partial: 'search_results' }
  		f.json { render json:    @companies.to_json }
  	end
  end

  def show
  	begin
      @company = Company.find_by_username(params[:company])
  		render template: "companies/#{params[:company]}/home"
  	rescue ActiveRecord::RecordNotFound, ActionView::MissingTemplate
  		render file: Rails.root.join('public/404.html'), layout: false, status: 404
  	end
  end
end