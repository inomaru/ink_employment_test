class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable
  
  # パスワードのバリデーション
  # 16文字以上20文字以内アルファベットの大文字小文字、数字、記号を含む
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)(?=.*?[\W_])[!-~]{16,20}+\z/
  validates :password,
            presence: true,
            format: {
              with: VALID_PASSWORD_REGEX
            }
end
