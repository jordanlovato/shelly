require 'test_helper'

class ShellyUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	# can't save without these
	def setup
		@must_be_present = [:username, :first_name, :password, :email]
	end

	test "must be present" do
		user = ShellyUser.new
		nil_values = @must_be_present.inject({}) {|a,i| a.update({i => nil})}	
		assert_not user.create!(nil_values), "Created user without attributes"
	end	
	# some fields cannot be blank
	test "blank user" do
		user = ShellyUser.new
		blank_values = @must_be_present.inject({}) {|a,i| a.update({i => ""})}
		assert_not user.create!(blank_values), "Created user with blank attributes"
	end 
end
