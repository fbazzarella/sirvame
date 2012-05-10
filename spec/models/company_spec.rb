require 'spec_helper'

describe Company do
	describe "mass assignment security" do
		[:name, :phone, :address, :segments, :products, :username, :plan].each do |attr|
			it { should allow_mass_assignment_of(attr).as(:admin) }
		end
	end

	describe "validations" do
		[:name, :phone, :segments].each do |attr|
			it { should validate_presence_of(attr) }
		end

		it { should allow_value('').for(:username) }
		it { should allow_value('user-name_1.2').for(:username) }
		it { should_not allow_value('user+name').for(:username) }
		it { should_not allow_value('Username').for(:username) }

		it { should allow_value('none').for(:plan) }
		it { should allow_value('plus').for(:plan) }
		it { should_not allow_value('other').for(:plan) }
	end

	describe "have page" do
		let!(:has_no_page) { FactoryGirl.create(:company, plan: 'none') }
		let!(:has_no_page_too) { FactoryGirl.create(:company, plan: 'plus', username: '') }
		let!(:has_page) { FactoryGirl.create(:company, plan: 'plus', username: 'company-name') }

		it "should return false if company is not a paying" do
			has_no_page.have_page?.should be_false
			has_no_page_too.have_page?.should be_false
		end

		it "should return true if company is a paying" do
			has_page.have_page?.should be_true
		end
	end
end