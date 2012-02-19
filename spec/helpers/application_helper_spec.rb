# -*- encoding : utf-8 -*-
require 'spec_helper'

describe ApplicationHelper do
	describe "page title" do
		it "should returns anything" do
			page_title.should be
		end
	end
end