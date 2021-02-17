require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    new_user1 = User.new(
      name: "Raymond Doan",
      email: "email@address.com",
      password: "qwe123"
    )
    new_user1.save!
    new_user2 = User.create(
      name: "James Dean",
      email: "dean@james.com",
      password: "!@#qwe"
    )

    assign(:listings, [
      Listing.create!(
        title: "Title",
        description: "MyText",
        price: "",
        sold: false,
        user: new_user1
      ),
      Listing.create!(
        title: "Title",
        description: "MyText",
        price: "",
        sold: false,
        user: new_user2
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
