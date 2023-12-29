class AuthController < ApplicationController
  require 'securerandom'
  before_action :authenticate_user!

  def new
  end

  def create
    return_token = SecureRandom.alphanumeric(30)
    token = BCrypt::Password.create(return_token)
    current_user.update(
      token: token
    )
    render inline: "<p id='generated_token'>token: #{return_token}</p>"
  end
end
