class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login_user!(user)
        session[:session_token] = user.reset_sesession_token
    end

    def logout!
        current_user.reset_session_token! if current_user
        session[:session_token] = nil
    end
    
loggdef logged_in?
        !!current_user
    end

    def ensure_logged_out
        if logged_in? 
            redirect_to cats_url
        end 
    end

end
