class CompanyController < ApplicationController
  def index
  	@companies = Company.all
  end
end