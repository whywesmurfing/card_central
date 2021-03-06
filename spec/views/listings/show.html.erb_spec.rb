require 'rails_helper'

RSpec.describe "listings/show", type: :view do
  before(:each) do
    new_user = User.new(
      name: "Raymond Doan",
      email: "test1@address.com",
      password: "qwe123"
    )
    new_user.save!

    @listing = assign(:listing, Listing.create!(
      title: "Title",
      description: "MyText",
      price: "",
      sold: false,
      user: new_user
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
