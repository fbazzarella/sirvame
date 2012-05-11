require 'spec_helper'

describe PagesController do
  render_views

  describe "GET sitemap" do
    describe "rendering" do
      before { get :sitemap, format: :xml }

      it "should return success" do
        response.should be_success
      end

      it "should render sitemap without layout" do
        response.should render_template('sitemap')
        response.should_not render_with_layout('application')
      end

      it "should render sitemap as xml" do
        response.body.should =~ /^\<\?xml/
      end
    end
  end
end