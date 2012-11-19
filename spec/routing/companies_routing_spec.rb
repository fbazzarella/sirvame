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

    it "should company path routes to show" do
    	get('/company').should route_to('companies#show', company: 'company')
    	company_path(:company).should == '/company'
    end

    it "should fix_phone path routes to fix_phone" do
      post('/companies/1/fix_phone').should route_to('companies#fix_phone', id: '1')
      fix_phone_path(1).should == '/companies/1/fix_phone'
    end
  end
end
