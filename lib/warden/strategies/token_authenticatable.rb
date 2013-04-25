module Warden
  module Strategies
    class TokenAuthenticatable < Base
      def valid?
        token.present?
      end

      def authenticate!
        message = "Invalid token for customer"
        customer = Customer.find_by_token(params['token'])
        if customer
          success! customer
        else
          fail! message
        end
      rescue Exception => e
        Rails.logger.info "Authentication error for token '#{token}': #{e.message}"
        Rails.logger.debug e.backtrace
        fail! message
      end

      def token
        params[Auth::Token.param]
      end
    end
  end
end
