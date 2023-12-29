class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:api_hello_world, :register]
  def top
    render 'layouts/top'
  end
  def hello
    render 'layouts/top'
  end
  def api_hello_world
    if request.headers[:HTTP_TOKEN].nil?
      redirect_to root_url
    else
      if User.find_by(token: request.headers[:HTTP_TOKEN])
        render json: {"message": "Hello,World", status: 200}
      else
        redirect_to root_url
      end
    end
  end
  def register
    if user_signed_in?
      redirect_to root_url
    else
      redirect_to new_user_registration_url
    end
  end
end
