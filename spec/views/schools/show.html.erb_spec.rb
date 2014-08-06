require 'rails_helper'

RSpec.describe "schools/show", :type => :view do
  before(:each) do
    @school = assign(:school, School.create!(
      :spot_id => 1,
      :sports => 2,
      :name => "Name",
      :latitude => "9.99",
      :longitude => "9.99",
      :link => "Link",
      :affiliation => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Link/)
    expect(rendered).to match(/3/)
  end
end
