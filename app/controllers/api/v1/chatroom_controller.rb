class Api::V1::ChatroomController < Api::V1::BaseController
  before_action :check_vaild_request

  def index
    render json: Chatroom.all
  end

  private

  def check_vaild_request
    if ApiKeyService.new(params['api_key']).invalid?
      render json: invalid_request_response
    end
  end
end
