require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Auth500px < OmniAuth::Strategies::OAuth

      option :name, '500px'
      option :client_options, {
        :access_token_path => '/v1/oauth/access_token',
        :authorize_path => '/v1/oauth/authorize',
        :request_token_path => "/v1/oauth/request_token",
        :site => 'https://api.500px.com'
      }

      info do
        {
          :nickname => user_info['username'],
          :email => raw_info['email'],
          :first_name => raw_info['firstname'],
          :last_name => raw_info['lastname'],
          :description => user_info['about'],
          :image => raw_info['userpic_url'],
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end

      uid { raw_info["id"] }
      
      def request_phase
        options[:authorize_params] = {:perms => options[:scope]} if options[:scope]
        super
      end

    
      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('/v1/users.json').body)
        rescue ::Errno::ETIMEDOUT
          raise ::Timeout::Error
      end


      def user_info
        @user_info ||= raw_info.nil? ? {} : raw_info["user"]
      end
    end
  end
end
