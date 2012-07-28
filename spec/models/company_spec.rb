# encoding: utf-8
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

	let!(:company1) { FactoryGirl.create(:company, segments: 'Motórs', products: 'bike', plan: 'none') }
	let!(:company2) { FactoryGirl.create(:company, segments: 'Sports', products: 'ball', plan: 'plus', username: '') }
	let!(:company3) { FactoryGirl.create(:company, segments: 'Movies', products: 'dvds', plan: 'plus', username: 'company-name') }

	describe "scopes" do
		describe "all to sitemap" do
			subject { Company.all_to_sitemap }

			it { should_not include(company1, company2) }
			it { should include(company3) }
		end

		describe "all to home" do
			subject { Company.all_to_home }

			it "should include all companies" do
				subject.all.should include(company1, company2, company3)
			end

			it "should have calculated popularity to specific company" do
				Search.perform_with('bike')
				subject.where(id: company1.id).first.popularity.should == '1'
			end
		end

		describe "search" do
			it "should return companies filtered by word list ignoring accents" do
				Company.search('Motors').should include(company1)
				Company.search('Motors').should_not include(company2, company3)
			end

			it "should return nothing if none company is founded" do
				Company.search('icecream').should be_empty
			end
		end
	end

	describe "instance methods" do
		describe "have page" do
			it "should return false if company is not a paying" do
				company1.have_page?.should be_false
				company2.have_page?.should be_false
			end

			it "should return true if company is a paying" do
				company3.have_page?.should be_true
			end
		end
	end
end