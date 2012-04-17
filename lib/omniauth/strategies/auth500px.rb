require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Auth500px < OmniAuth::Strategies::OAuth

      option :name, '500px'
      option :client_options, {
        :authorize_path => '/v1/oauth/authorize',
        :token_path => '/v1/oauth/access_token',
        :request_token_path => "/v1/oauth/request_token",
        :site => 'https://api.500px.com'
      }

      info do
        {
          :user_id      => raw_info["id"],
          :first_name   => raw_info["firstname"],
          :last_name    => raw_info["lastname"],
          :image        => raw_info["userpic_url"],
          :url          => raw_info["permalink"],
        }
      end

      uid { raw_info["id"] }

    
      def raw_info      
        @raw_info ||= MultiJson.decode(access_token.get('/v1/oauth/users').body)["user"]
      end
    end
  end
end
