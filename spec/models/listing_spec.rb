require 'rails_helper'

RSpec.describe Listing, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before(:each) do
    new_user = User.new(
      name: "Raymond Doan",
      email: "test1@address.com",
      password: "qwe123"
    )
    new_user.save!
  
    @invalid_listing = Listing.new(
      title: nil,
      description: "cool card",
      price: "",
      sold: false,
      user: new_user
    )
  end

  it "requires a title" do
    expect(@invalid_listing.valid?).to be(false)  
  end
  
end
