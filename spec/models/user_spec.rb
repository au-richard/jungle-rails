require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User Validations" do
    before :each do
      User.destroy_all
    end

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
    before :each do
      User.destroy_all
    end

    it "should get the User if email and password are valid" do
      user_on_register = User.create!(first_name: "John", last_name: "Smith", email: "john@yahoo.com", password: "123456", password_confirmation: "123456")
      user_on_login = User.authenticate_with_credentials(user_on_register.email, user_on_register.password)
      expect(user_on_register.email).to eq(user_on_login.email)
    end

    it "should not get a User if both email and password are invalid" do
      user_on_register = User.create!(first_name: "John", last_name: "Smith", email: "john@yahoo.com", password: "123456", password_confirmation: "123456")
      user_on_login = User.authenticate_with_credentials("james@bob.com", "abcdefg")
      # puts "User Login", user_on_login.email
      expect(user_on_login).to eq(nil)
    end

    it "should not get a User if email is invalid" do
      user_on_register = User.create!(first_name: "John", last_name: "Smith", email: "john@yahoo.com", password: "123456", password_confirmation: "123456")
      user_on_login = User.authenticate_with_credentials("james@bob.com", user_on_register.password)
      expect(user_on_login).to eq(nil)
    end

    it "should not get a User if password is invalid" do
      user_on_register = User.create!(first_name: "John", last_name: "Smith", email: "john@yahoo.com", password: "123456", password_confirmation: "123456")
      user_on_login = User.authenticate_with_credentials(user_on_register.email, "abcdefg")
      expect(user_on_login).to eq(nil)
    end

    it "get the User even if email is uppercase" do
      user_on_register = User.create!(first_name: "John", last_name: "Smith", email: "john@yahoo.com", password: "123456", password_confirmation: "123456")
      user_on_login = User.authenticate_with_credentials(user_on_register.email.upcase, user_on_register.password)
      expect(user_on_register.email).to eq(user_on_login.email)
    end

    it "get the User even if input email has whitespace" do
      user_on_register = User.create!(first_name: "John", last_name: "Smith", email: "john@yahoo.com", password: "123456", password_confirmation: "123456")
      user_on_login = User.authenticate_with_credentials("  " + user_on_register.email + "  ", user_on_register.password)
      expect(user_on_register.email).to eq(user_on_login.email)
    end
  end
end








