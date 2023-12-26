class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:api_hello, :register]
    def top
        render 'layouts/top'
    end
    def hello
        render 'layouts/top'
    end
    def api_hello
        render json: {"message": "Hello,World", status: 200}
    end
    def register
        if user_signed_in?
            redirect_to root_url
        else
            redirect_to new_user_registration_url
        end
    end
    def logout
        if user_signed_in?
            redirect_to destroy_user_session_url(current_user)
        else
            redirect_to new_user_registration_url
        end
    end
end
