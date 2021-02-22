class User < ApplicationRecord
  
  has_many :user_stocks
  has_many :stocks , through: :user_stocks
  
  has_many :freindships
  has_many :freinds, through: :freindships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def stock_already_tracked?(ticker_symbol)

    stock = Stock.check_db(ticker_symbol)
    return false unless stock
    stocks.where(id:stock.id).exists?

  end
    def under_stock_limit?
    stocks.count < 10
  end

  def can_track_stock?(symbol)
    under_stock_limit? and !stock_already_tracked?(symbol)
  end

  def fullname
    return first_name+" "+last_name if first_name or last_name
    return "Anonymous"
  end

  def except_current_user(users)
    users.reject { |user| user.id == self.id } 
  end

  def not_friends_with?(id)
    !self.freinds.where(id: id).exists?
  end
  def self.search(param)
    param.strip! #remove spaces
    return_string = (first_name_matches(param) + last_name_matches(param) + email_matches(param)).uniq
    return nil unless return_string
    return return_string

  end

  def self.first_name_matches(param)
    self.matches('first_name',param)
  end
  
  def self.last_name_matches(param)
    self.matches('last_name',param)
  end
  
  def self.email_matches(param)
    self.matches('email',param)
  end
  
  def self.matches(field_name,param)
    where("#{field_name} like ?","%#{param}%")
  end
end
