require "./spec_helper"
require "../../src/models/user.cr"

describe User do
  Spec.before_each do
    User.clear
  end

  describe ".generate_salt" do
    it "should return random string" do
      User.generate_salt.should_not be_nil
    end
  end

  describe ".encrypt_password" do
    it "return an encrypt password" do
      password = "123456"
      salt = User.generate_salt
      User.encrypt_password(password, salt).should_not be_nil
    end
  end

  describe ".login_from_user" do
    it "login success and return user" do
      user = User.create_one "test", "test@sample.com", "123456"
      logined = User.login_from_user("test@sample.com", "123456")
      logined.should_not be_nil
      logined.as(User).id.should eq user.id
    end
  end

  describe ".login_from_cookie" do
    it "login success and return user" do
      user = User.create_one "test", "test@sample.com", "123456"
      logined = User.login_from_cookie(user.id.as(Int64))
      logined.should_not be_nil
      logined.as(User).id.should eq user.id
    end
  end
end
