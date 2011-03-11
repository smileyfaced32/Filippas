require 'spec_helper'

describe DashboardController do

  describe "GET 'userprofile'" do
    it "should be successful" do
      get 'userprofile'
      response.should be_success
    end
  end

end
