class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:api_hello_world, :register, :api_users]
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
  def logout
    if user_signed_in?
      redirect_to destroy_user_session_url(current_user)
    else
      redirect_to new_user_registration_url
    end
  end
  def users
    if current_user.auth_level == 'admin'
      @users = User.all
    end
    render 'layouts/users'
  end
  def api_users
    if request.headers[:HTTP_TOKEN].nil?
      render :status=> 200, :json => {} and return
    else
      if User.find_by(token: request.headers[:HTTP_TOKEN])
        token_user = User.find_by(token: request.headers[:HTTP_TOKEN])
        logger.debug "task: #{token_user.email}"
        if token_user.auth_level == 'admin'
          render :status=> 200, :json => {result: 'ng'} and return
        else
          render :status=> 200, :json => {} and return
        end
      else
        render :status=> 200, :json => {} and return
      end
    end
  end
end
