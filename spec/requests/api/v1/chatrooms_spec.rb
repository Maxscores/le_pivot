require 'rails_helper'
describe "As a user with an API key" do
  describe "when I send a get request to the search api endpoint" do
    it "returns a json response with items with matching name and description" do
      chatroom_1 = create(:chatroom)
      chatroom_2 = create(:chatroom)

      user = create(:user)
      developer = create(:developer, user: user)

      get "/api/v1/chatrooms?api_key=#{developer.key}"

      search_response = JSON.parse(response.body)

      expected_chatrooms_response = [{"id" => chatroom_1.id}, {"id" => chatroom_2.id}]
      
      expect(search_response).to eq(expected_chatrooms_response)
    end

    it "returns invalid request when a key is not sent" do
      get "/api/v1/chatrooms"

      search_response = JSON.parse(response.body)

      expect(search_response['results']).to eq('invalid request')
    end
  end
end
