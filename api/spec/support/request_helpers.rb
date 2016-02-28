module Requests
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end

    def set_authentication_headers_for(user)
      user_headers = user.create_new_auth_token
      @request.headers.merge!(user_headers)
    end
  end
end

RSpec.configure do |config|
  config.include Requests::JsonHelpers
end