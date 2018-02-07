require 'rails_helper'

RSpec.describe Store do
  describe 'validations' do
    describe 'invalid attributes' do
      it 'is invalid without a  name' do
        store = build(:store, name: nil)
        expect(store).to be_invalid
      end
      it 'it is invalid without an address' do
        store = build(:store, address: nil)
        expect(store).to be_invalid
      end
      it 'it is invalid without an status' do
        store = build(:store, status: nil)
        expect(store).to be_invalid
      end
    end
  end
  describe 'relationships' do
    it "can have many items" do
      store = build(:store)
      item = build(:item)
      expect(item).to respond_to(:store)
    end
    it "should belong to a user" do
      store = build(:store)
      user = build(:user)
      expect(user).to respond_to(:stores)
      expect(store).to respond_to(:user)
    end
  end
end
