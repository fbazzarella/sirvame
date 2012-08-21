require 'spec_helper'

describe LeadsController do
  describe "routing" do
    it "should new path routes to new" do
      get('/experimente-gratis-sem-compromisso-por-30-dias').should route_to('leads#new')
      new_lead_path.should == '/experimente-gratis-sem-compromisso-por-30-dias'
    end

    it "should create path routes to create" do
      post('/experimente-gratis-sem-compromisso-por-30-dias').should route_to('leads#create')
      leads_path.should == '/experimente-gratis-sem-compromisso-por-30-dias'
    end

    it "should effectived path routes to effectived" do
      get('/experimente-gratis-sem-compromisso-por-30-dias/sabia-decisao').should route_to('leads#effectived')
      effectived_lead_path.should == '/experimente-gratis-sem-compromisso-por-30-dias/sabia-decisao'
    end
  end
end