# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Company do
	describe "mass assignment security" do
		[:name, :phone, :address].each do |attr|
			it { should allow_mass_assignment_of(attr).as(:admin) }
		end
	end

	describe "validations" do
		[:name, :phone].each do |attr|
			it { should validate_presence_of(attr)}
		end
	end
end