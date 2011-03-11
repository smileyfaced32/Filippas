require 'spec_helper'

describe UserController do

  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET '_form'" do
    it "should be successful" do
      get '_form'
      response.should be_success
    end
  end

end
