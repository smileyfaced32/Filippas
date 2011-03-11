require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'blog'" do
    it "should be successful" do
      get 'blog'
      response.should be_success
    end
  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end
  end

  describe "GET 'privacy'" do
    it "should be successful" do
      get 'privacy'
      response.should be_success
    end
  end

  describe "GET 'restaurant'" do
    it "should be successful" do
      get 'restaurant'
      response.should be_success
    end
  end

  describe "GET 'banquets'" do
    it "should be successful" do
      get 'banquets'
      response.should be_success
    end
  end

  describe "GET 'catering'" do
    it "should be successful" do
      get 'catering'
      response.should be_success
    end
  end

  describe "GET 'events'" do
    it "should be successful" do
      get 'events'
      response.should be_success
    end
  end

end
