# -*- encoding : utf-8 -*-
require 'spec_helper'

describe ApplicationHelper do
	describe "page title" do
		it "should return anything" do
			page_title.should be
		end
	end

	describe "normalize search params" do
		it "should return with comma separator" do
			normalize_search_params('first+second').should == 'first, second'
		end

		it "should return nothing if no param is passed" do
			normalize_search_params.should be_blank
		end
	end
end