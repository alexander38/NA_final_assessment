require 'rails_helper'

RSpec.describe User, type: :model do

	let(:user) {User.create!(username: "testing", email: "testing@gmail.com", password: "12345678", password_confirmation: "12345678")}
	let(:email) {"testing@gmail.com"}
	let(:password) {"12345678"}

	 it "should have username and email and password_digest" do 
	  	should have_db_column(:username).of_type(:string)
	    should have_db_column(:email).of_type(:string)
	    should have_db_column(:password_digest).of_type(:string)
	 end

	 describe "required validation for creating new users" do
		it {should have_secure_password}
		it {should validate_presence_of(:password)}
		it {should validate_uniqueness_of(:email)}
		it {should validate_presence_of(:email)}
	end

	describe "#authenticate" do
		it "returns to me false when password" do
			x = "hihihi"
			expect(user.authenticate(x)).to eq(false)
		end

		it "returns user when password is correct" do
			expect(user.authenticate(password)).to eq(user)
		end

		it "raises error when no argument is given" do
			expect{user.authenticate()}.to raise_error
		end

		it "raises no error when an argument is given" do
			expect{user.authenticate(password)}.to_not raise_error(ArgumentError)
		end

		
	end

end  	