#require 'spec_helper'
require "./lib/blugem.rb"
describe Blugem do
	context "Authentication" do
		it "should return and authToken" do
			# => Placeholder test for now until Auth is finished
			expect(Blugem::Auth.login).not_to be_empty
		end
	end

	context "Gem version" do
    it "should be test" do
      expect(Blugem::Auth.test).to include("test")
      # => Fail
    end

		it "should not be empty" do
			gemversion = Blugem::Auth.version
			expect(gemversion).not_to be_empty
		end
	end

end
