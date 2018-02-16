class Api::V1::SearchController < Api::V1::BaseController
  before_action :check_vaild_request

  def index
    if params[:type] == 'items'
      render json: SearchService.new(params), serializer: ItemSearchSerializer
    else
      invalid_request
    end
  end

  private
    def check_vaild_request
      if invalid_request
        render json: invalid_request_response
      end
    end

    def invalid_request
      return true if params['type'].nil?
      return true if params['q'].nil?
      return true if ApiKeyService.new(params['api_key']).invalid?
    end
end
