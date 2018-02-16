class Api::V1::BaseController < ApplicationController
  def invalid_request_response
    {results: "invalid request"}
  end
end
