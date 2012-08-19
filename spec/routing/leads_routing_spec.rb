require 'spec_helper'

describe LeadsController do
  describe "routing" do
    it "should new path routes to new" do
      get('/anunciar-gratis-por-30-dias').should route_to('leads#new')
      new_lead_path.should == '/anunciar-gratis-por-30-dias'
    end

    it "should create path routes to create" do
      post('/anunciar-gratis-por-30-dias').should route_to('leads#create')
      leads_path.should == '/anunciar-gratis-por-30-dias'
    end

    it "should effectived path routes to effectived" do
      get('/anunciar-gratis-por-30-dias').should route_to('leads#new')
      effectived_lead_path.should == '/anunciar-gratis-por-30-dias/sabia-decisao'
    end
  end
end