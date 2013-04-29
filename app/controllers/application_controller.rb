class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

    def current_or_guest_user(force_creation=true)
      # TODO: current_user switch, when we add Devise.
      guest_user(force_creation)
    end
    helper_method :current_or_guest_user

    # Returns a Customer or nil - force_creation ensures it'll always return a Customer.
    def guest_user(force_creation=true)
      return @guest_user if @guest_user

      if session[:guest_customer_id]
        @guest_user = Customer.find(session[:guest_customer_id])
      else
        if force_creation
          @guest_user = create_guest_user
          session[:guest_customer_id] = @guest_user.id
        end
      end

      @guest_user # Customer, or nil

    rescue ActiveRecord::RecordNotFound # invalid guest_user_id
      session[:guest_customer_id] = nil
      guest_user(force_creation)
    end

    protected

      def require_login
        redirect_to root_url, :alert => warden.message unless current_or_guest_user
        true
      end

      def create_guest_user
        customer = Customer.create
        customer.save!
        customer
      end
end
