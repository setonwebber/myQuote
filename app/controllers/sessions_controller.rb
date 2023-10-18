class SessionsController < ApplicationController
    def new
    end

    def create
        # First finds a user by the email entered in the /login view.
        user = User.find_by(email: params[:email])

        # Checks if user exists, and checks if the password entered is the correct password (using hashing so its secure, through bcrypt), and checks if the user is active.
        if user && user.authenticate(params[:password]) && user.status == "Active"
            # If login passes, set many session variable to be referenced later.
            session[:user_id] = user.id
            session[:fname] = user.fname
            session[:is_admin] = user.is_admin
            # Check if the user is admin.
            if session[:is_admin]
                # Redirect the user to admin page if they're admin.
                redirect_to admin_path, notice: "Logged in successfully!"
            else
                # Redirect the user to user page if they're not admin.
                redirect_to userhome_path, notice: "Logged in successfully!"
            end
        else
            # If login failed, display error.
            flash.now[:error] = "Invalid email or password. Please try again."
            # Resets the login page.
            render 'new'
        end
    end

    def destroy
        # Destroying the session, logging out.
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out successfully!"
    end
end
