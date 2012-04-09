# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Company do
	describe "mass assignment security" do
		[:name_list, :phone, :address, :segment_list, :product_list, :plus].each do |attr|
			it { should allow_mass_assignment_of(attr).as(:admin) }
		end
	end

	describe "validations" do
		[:name_list, :phone, :segment_list].each do |attr|
			it { should validate_presence_of(attr) }
		end
	end

	describe "evaluate relevance based on" do
		let!(:company) { FactoryGirl.create(:company,
			name_list: 'Company Name', segment_list: 'motors', product_list: 'bikes') }

		it "should return result relevance based on term list" do
			company.evaluate_relevance_based_on('company, name, motors, bikes').should == -9
			company.evaluate_relevance_based_on('company, motors, bikes').should == -6
			company.evaluate_relevance_based_on('company, bikes').should == -5
		end
	end
end