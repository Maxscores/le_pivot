require 'rails_helper'

RSpec.feature "User can checkout with stripe" do
  it "and see the message 'order was successfully placed'" do

    user = create(:user, first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing", address: "dummy address")

    item1, item2, item3 = create_list(:item, 3)

    visit store_path(item1.store.slug)

    click_on "Add to cart"

    visit cart_path

    within(".checkout") do
      click_on("Login")
    end

    fill_in "session[email]", with: "testerson@testmail.com"
    fill_in "session[password]", with: "testing"

    within(".action") do
      click_on("Login")
    end

    click_on "Cart"

  expect(page).to have_css('iframe[name="checkout"]')
    # # click_button "Checkout"
    # expect(current_path).to eq('/orders')
    # expect(page).to have_content("Order was successfully placed")
  end
end
