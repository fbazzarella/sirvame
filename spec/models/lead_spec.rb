require 'spec_helper'

describe Lead do
  describe "mass assignment security" do
    [:company_name, :contact_name, :email].each do |attr|
      it { should allow_mass_assignment_of(attr) }
    end
  end

  describe "validations" do
    [:company_name, :contact_name, :email].each do |attr|
      it { should validate_presence_of(attr) }
    end

    it { should allow_value('email@example.com').for(:email) }
    it { should_not allow_value('email@example').for(:email) }
    it { should_not allow_value('example.com').for(:email) }
  end

  describe "after_create" do
    let!(:mailer) { NotificationMailer.new_lead }
    after         { FactoryGirl.create(:lead) }

    it "should create and deliver new lead notification email once time" do
      NotificationMailer.should_receive(:new_lead).once.and_return(mailer)
      mailer.should_receive(:deliver).once
    end
  end
end
