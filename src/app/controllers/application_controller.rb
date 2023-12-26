class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:api_hello, :register]
    def top
        render inline: '<h1>Top page.</h1>'
    end
    def hello
        render inline: '<h1>Hello,World</h1>'
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
end
