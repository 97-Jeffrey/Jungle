require "rails_helper"

RSpec.describe User, type: :model do
  describe "user validation" do
    it "should be valid with its attribute" do
      user = User.new(first_name:"Yu Hao", last_name:"Shao", email:"shao0909@gmail.com", password:"12345", password_confirmation:"12345")
      expect(user).to be_valid
      expect(user.errors.full_messages).to be_empty
      expect(user)
    end

    it "should not be valid as emals in db are not case_sensitive" do
      user1 = User.create(first_name:"haha", last_name:"hehe",email:"test@test.COM", password:"12345", password_confirmation:"12345")
      same_user1 = User.create(first_name:"haha", last_name:"hehe", email:"TEST@TEST.com" , password:"12345", password_confirmation:"12345")
      expect(same_user1).not_to be_valid
    end

    it "should not be valid when password is less than required length" do 
      user = User.create(first_name:"haha", last_name:"hehe",email:"test@test.COM", password:"123", password_confirmation:"123")
      expect(user).not_to be_valid
    end

    it "should not be valid when missing last name" do
      user = User.create(first_name:'hey', email:"haha@test.com", password:"awesome",password_confirmation:"awesome")
      expect(user).not_to be_valid
    end
    
    it "should not be valid when missing first name" do
      user = User.create(last_name:'hey', email:"haha@test.com", password:"awesome",password_confirmation:"awesome")
      expect(user).not_to be_valid
    end

    it "should not be valid when missing email" do
      user = User.create(last_name:'hey',first_name:"haha", password:"awesome",password_confirmation:"awesome")
      expect(user).not_to be_valid
    end

    it "should not be valid when missing password confirmation" do
      user = User.create(last_name:'hey',first_name:"haha", email:"thisisgreat@gmail.com",password:"awesome")
      expect(user).not_to be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    it "should anthenticate when login infos are correct" do
      person1 = User.create(first_name:"Yu Hao", last_name:"Shao", email:'shao0909@gmail.com',password:"678910", password_confirmation:"678910")
      loginPerson1 = User.authenticate_with_credentials(person1.email, person1.password)
      expect(loginPerson1).to eq person1
    end
    
    it "should not anthenticate when login infos are incorrect, case: incorrect email" do
      person1 = User.create(first_name:"Yu Hao", last_name:"Shao", email:'shao0909@gmail.com',password:"678910", password_confirmation:"678910")
      loginPerson1 = User.authenticate_with_credentials('shao@gmail.com', person1.password)
      expect(loginPerson1).not_to eq person1
    end

    it "should not anthenticate when login infos are incorrect, case: incorrect password" do
      person1 = User.create(first_name:"Yu Hao", last_name:"Shao", email:'shao0909@gmail.com',password:"678910", password_confirmation:"678910")
      loginPerson1 = User.authenticate_with_credentials(person1.email, '233333')
      expect(loginPerson1).not_to eq person1
    end

    it "should anthenticate even extra spaces are before/after email" do
      person1 = User.create(first_name:"Yu Hao", last_name:"Shao", email:'shao0909@gmail.com',password:"678910", password_confirmation:"678910")
      loginPerson1 = User.authenticate_with_credentials(' shao0909@gmail.com ', person1.password)
      expect(loginPerson1).to eq person1
    end

    it "should anthenticate even extra spaces are before/after email" do
      person1 = User.create(first_name:"Yu Hao", last_name:"Shao", email:'shao0909@gmail.com',password:"678910", password_confirmation:"678910")
      loginPerson1 = User.authenticate_with_credentials('SHAO0909@gmail.com', person1.password)
      expect(loginPerson1).to eq person1
    end
  end
end
