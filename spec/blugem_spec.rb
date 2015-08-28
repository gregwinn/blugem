#require 'spec_helper'
require "./lib/blugem.rb"
describe Blugem do

	context "Gem version" do
    it "should be test" do
      expect(Blugem.test).to include("test")
      # => Fail
    end

		it "should not be empty" do
			gemversion = Blugem.version
			expect(gemversion).not_to be_empty
		end
	end

end
