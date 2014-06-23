module Api
  module V1
    class SessionsController < Devise::SessionsController
      skip_before_filter :restrict_access_by_token, :only => [:new, :create]
      respond_to :json

      def create
        self.resource = warden.authenticate!(:scope => resource_name)
        sign_in(resource_name, resource)
        render :json => resource, :status => :ok
      end

      def destroy
        @current_user.reset_authentication_token!
        super
      end

      protected

        def invalid_login_attempt
          warden.custom_failure!
          render json: { success: false, message: 'Error with your login or password' }, status: :anauthorized
        end
    end
  end
end
