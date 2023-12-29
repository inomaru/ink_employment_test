class AuthController < ApplicationController
  require 'securerandom'
  before_action :authenticate_user!

  def new
  end

  def create
    # ランダムな30文字のtokenを発行
    return_token = SecureRandom.alphanumeric(30)
    current_user.update(
      token: return_token
    )
    render inline: "<p id='generated_token'>token: #{return_token}</p>"
  end
end
