require "omniauth-oauth2"

module OmniAuth
	module Strategies
	  class Feedly < OmniAuth::Strategies::OAuth2
	    
	    DEFAULT_SCOPE = 'https://cloud.feedly.com/subscriptions'

	    option :name => 'feedly'

	    option :client_options, {
        :site => 'https://cloud.feedly.com',
        :authorize_url => '/v3/auth/auth',
        :token_url => '/v3/auth/token',
        :scope => 'https://cloud.feedly.com/subscriptions',
	    	:response_type => 'code'
      }

      option :access_token_options, {
        :header_format => 'OAuth %s',
        :param_name => 'access_token'
      }

      uid{ raw_info['id'] }

      info do
        {
          :email => raw_info['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/v3/profile').parsed
      end


      def authorize_params 
        # Stole from omniauth-orchid who stole from omniauth-facebook 
        super.tap do |params|
          %w[scope].each { |v| params[v.to_sym] = request.params[v] if request.params[v] }
          params[:scope] ||= DEFAULT_SCOPE # ensure that we're always request *some* default scope
        end
      end


	  end
	end
end