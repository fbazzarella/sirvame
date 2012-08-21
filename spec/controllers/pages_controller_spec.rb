require 'spec_helper'

describe PagesController do
  render_views

  describe "GET questions" do
    before { get :questions }

    it "should return success" do
      response.should be_success
    end

    it "should render questions with layout" do
      response.should render_template('questions')
      response.should render_with_layout('application')
    end

    it "should raise missing template if invalid format is passed" do
      expect do
        get :questions, format: :xml
      end.to raise_error(ActionView::MissingTemplate)
    end
  end

  describe "GET sitemap" do
    before do
      FactoryGirl.create(:company, plan: 'plus')
      get :sitemap, format: :xml
    end

    it "should assign a array on companies with companies that be able to show on sitemap" do
      assigns(:companies).should be_a(ActiveRecord::Relation)
      assigns(:companies).first.should be_a(Company)
    end

    describe "rendering" do
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

      it "should raise missing template if invalid format is passed" do
        expect do
          get :sitemap, format: :html
        end.to raise_error(ActionView::MissingTemplate)
      end
    end
  end

  describe "GET robots" do
    describe "rendering" do
      before { get :robots, format: :txt }

      it "should return success" do
        response.should be_success
      end

      it "should render robots without layout" do
        response.should render_template('robots')
        response.should_not render_with_layout('application')
      end

      it "should render robots as text" do
        response.body.should =~ /User-Agent/
      end

      it "should raise missing template if invalid format is passed" do
        expect do
          get :robots, format: :html
        end.to raise_error(ActionView::MissingTemplate)
      end
    end
  end
end