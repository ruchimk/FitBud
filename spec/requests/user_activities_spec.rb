require 'rails_helper'

RSpec.describe "UserActivities", :type => :request do
  describe "GET /user_activities" do
    it "works! (now write some real specs)" do
      visit user_activities_path
      expect(response).to have_http_status(200)
    end
  end
end
