class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:hello, :api_hello]
    def top
        render inline: '<h1>Top page.</h1>'
    end
    def hello
        render inline: '<h1>Hello,World</h1>'
    end
    def api_hello
        render json: {"message": "Hello,World", status: 200}
    end
end
