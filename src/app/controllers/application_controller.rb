class ApplicationController < ActionController::Base
    def hello
        render inline: '<h1>Hello,World</h1>'
    end
    def api_hello
        render json: {"message": "Hello,World", status: 200}
    end
end
