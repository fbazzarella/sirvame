require 'spec_helper'

describe Company do
	describe "associations" do
		it { should have_and_belong_to_many(:searches) }
	end

	describe "mass assignment security" do
		[:name, :phone, :segments, :products, :plan].each do |attr|
			it { should allow_mass_assignment_of(attr).as(:import) }
		end

		[:address, :username].each do |attr|
			it { should_not allow_mass_assignment_of(attr) }
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

	let(:company)  { FactoryGirl.create(:company, plan: 'none') }
	let(:company1) { FactoryGirl.create(:company, plan: 'plus', username: '') }
	let(:company2) { FactoryGirl.create(:company, plan: 'plus', username: 'company-name') }

	describe "scopes" do
		describe "all to sitemap" do
			subject { Company.all_to_sitemap }

			it { should_not include(company) }
			it { should_not include(company1) }
			it { should include(company2) }
		end
	end

	describe "instance methods" do
		describe "have page" do
			it "should return false if company is not a paying" do
				company.have_page?.should be_false
				company1.have_page?.should be_false
			end

			it "should return true if company is a paying" do
				company2.have_page?.should be_true
			end
		end
	end
end