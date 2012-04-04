# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Search do
	describe "mass assignment security" do
		it { should allow_mass_assignment_of(:term_list) }
	end

	describe "validations" do
		it { should validate_presence_of(:term_list)}
	end
end