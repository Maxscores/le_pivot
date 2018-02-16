class Api::V1::ChatroomController < ApplicationController
  def index
    render json: Chatroom.all
  end
end
