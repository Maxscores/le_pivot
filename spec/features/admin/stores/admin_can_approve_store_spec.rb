require 'rails_helper'

RSpec.feature "Admin Stores" do
  before(:each) do
    admin = create(:admin)
    create(:store,name:"store_1", status: "active")
    create(:store, name:"store_2", status: "pending")
    create(:store, name: "store_3", status: "suspended")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end


  it "As an admin I can approve a pending store  " do

    visit admin_stores_pending_path

    click_on "Approve"

    expect(current_path).to eq(admin_stores_path)
    expect(page).to have_content("store_2")
    expect(page).not_to have_content("store_3")


  end
end
