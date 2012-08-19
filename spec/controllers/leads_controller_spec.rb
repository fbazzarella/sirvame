require 'spec_helper'

describe LeadsController do
  render_views

  describe "GET new" do
    before { get :new }

    it "should assign a new lead" do
      FactoryGirl.build(:lead)

      assigns(:lead).should be_a(Lead)
      assigns(:lead).should_not be_persisted
    end

    describe "rendering" do
      it "should return success" do
        response.should be_success
      end

      it "should render with layout" do
        response.should render_template('new')
        response.should render_with_layout('application')
      end

      it "should raise missing template if invalid format is passed" do
        expect do
          get :new, format: :xml
        end.to raise_error(ActionView::MissingTemplate)
      end
    end
  end

  describe "GET effectived" do
    before { get :effectived }

    describe "rendering" do
      it "should return success" do
        response.should be_success
      end

      it "should render with layout" do
        response.should render_template('effectived')
        response.should render_with_layout('application')
      end

      it "should raise missing template if invalid format is passed" do
        expect do
          get :effectived, format: :xml
        end.to raise_error(ActionView::MissingTemplate)
      end
    end
  end
end