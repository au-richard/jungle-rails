require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User Validations" do

    it "should not create a User if :password and :password_confirmation don\'t match" do
      user = User.new(first_name: "John", last_name: "Smith", email: "john@yahoo.com", password: "123456", password_confirmation: "896575")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn\'t match Password")
    end

    it "should not create a User if there is no password" do
      user = User.new(first_name: "John", last_name: "Smith", email: "john@yahoo.com")
      user.valid?
      expect(user.errors[:password]).to include("can\'t be blank")
    end

    it "should not create a User if there the password is too short" do
      user = User.new(first_name: "John", last_name: "Smith", email: "john@yahoo.com", password: "123", password_confirmation: "123")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end  

    it "should not create a User if their email is missing" do
      user = User.new(last_name: "Smith", first_name: "John", password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user.errors[:email]).to include("can\'t be blank")
    end
    
    it "should not create a User if their email is not unique" do
      user1 = User.new(first_name: "John", last_name: "Smith", email: "johnson@gmail.com", password: "123456", password_confirmation: "123456")
      user1.save
      user2 = User.new(first_name: "Mike", last_name: "Johnson", email: "johnson@gmail.com", password: "123456", password_confirmation: "123456")
      puts user2.valid?
      puts user2.errors[:email].to_s
      expect(user2.errors[:email]).to include("has already been taken")
    end

    it "should not create a User if their name is missing" do
      user = User.new(email: "john@yahoo.com", password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user.errors[:first_name]).to include("can\'t be blank")
      expect(user.errors[:last_name]).to include("can\'t be blank")
    end

    it "should create a User if all of the validations are true" do
      user = User.new(first_name: "John", last_name: "Smith", email: "john@yahoo.com", password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors).not_to include("can\'t be blank")
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end


end








