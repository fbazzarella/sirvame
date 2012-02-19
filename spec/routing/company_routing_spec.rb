# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CompanyController do
  describe "routing" do
    it "should routes to index" do
      get('/').should route_to('company#index')
      root_path.should == '/'

      get('/search').should route_to('company#index')
      search_path.should == '/search'
    end
  end
end