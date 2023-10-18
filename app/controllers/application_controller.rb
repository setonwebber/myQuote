class ApplicationController < ActionController::Base
    # defines helper_methods we can use throughout the application, as everything inherits this controller.
    helper_method :current_user, :logged_in?, :is_administrator?

    # defines current user to the user who is currently logged in, using the session id.
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    # defines the logged_in? function, this checks if the current_user is a nil object, if it is not than it means the user is logged in.
    def logged_in?
        !current_user.nil?
    end

    # defines the is_administrator? function, this checks if the current_user is an adminstrator by checking its is_admin entry status. 
    def is_administrator?
        session[:is_admin]
    end

    private
        # defines the require_login helper, this can be used too ensure that the user is logged in to access any resource.
        def require_login
            unless logged_in?
                flash[:error] = "You are not permitted to access this resource"
                redirect_to login_path
            end
        end
        
        def require_admin
            unless is_administrator?
                flash[:error] = "You are not permitted to access this resource"
                redirect_to userhome_path
            end
        end
end
