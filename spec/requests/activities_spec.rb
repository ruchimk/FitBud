require 'rails_helper'

RSpec.describe "Activities", :type => :request do
  describe "GET /activities" do
    it "displays activities" do
      Activity.create!(:name => "running")
      get activities_path
      expect(body).to eq("running")
    end
  end
end
