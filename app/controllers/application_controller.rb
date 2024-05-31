class ApplicationController < ActionController::Base
    protected

    def after_sign_in_path_for(resource)
        user_path(resource) # Redirect to the user profile page after sign-in
    end
end
