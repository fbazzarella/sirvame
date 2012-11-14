require 'spec_helper'

describe CompaniesController do
  describe "routing" do
    it "should root path routes to index" do
      get('/').should route_to('companies#index')
      root_path.should == '/'
    end

    it "should search path routes to index" do
      get('/encontrar').should route_to('companies#index')
      companies_path.should == '/encontrar'
    end

    it "should company path routes do show" do
    	get('/company').should route_to('companies#show', company: 'company')
    	company_path(:company).should == '/company'
    end
  end
end
