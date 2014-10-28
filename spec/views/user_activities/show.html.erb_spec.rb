require 'rails_helper'

RSpec.describe "user_activities/show", :type => :view do
  before(:each) do
    @user_activity = assign(:user_activity, UserActivity.create!(
      :user_id => 1,
      :activity_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
