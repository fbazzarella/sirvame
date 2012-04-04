# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Search do
	describe "mass assignment security" do
		it { should allow_mass_assignment_of(:term_list) }
	end

	describe "validations" do
		it { should validate_presence_of(:term_list)}
	end

	describe "filter terms" do
		it "should remove blacklist's words from search terms" do
			Search.filter_terms(%w{should not include do}).should_not include('do')
		end

		it "should return empty array if none terms passed" do
			Search.filter_terms.should == []
		end
	end
end