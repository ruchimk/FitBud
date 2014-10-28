require 'rails_helper'

RSpec.describe "matches/show", :type => :view do
  before(:each) do
    @match = assign(:match, Match.create!(
      :user_id => 1,
      :partner_id => 2,
      :message => "Message",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Message/)
    expect(rendered).to match(/Status/)
  end
end
