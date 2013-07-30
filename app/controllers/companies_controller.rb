class CompaniesController < ApplicationController
  def index
    session[:back_to_catalog_path] = back_to_catalog_path(params)
    
    @companies = Search.perform_with(sanitize(params[:encontrar], :go), params[:page])
    
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

  def fix_phone
    Company.find(params[:id]).fix_phone(params[:phone_sugestion])
    head :ok
  end
end
