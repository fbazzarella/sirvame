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
end