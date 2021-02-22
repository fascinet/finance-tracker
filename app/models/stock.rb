class Stock < ApplicationRecord

  has_many :user_stocks
  has_many :users ,  through: :user_stocks
  #to define class methods use self.method name

  validates :name,:ticker, presence: true
  def self.look_up(symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:normal_token] ,
      secret_token: Rails.application.credentials.iex_client[:secret_token] ,
      endpoint: 'https://sandbox.iexapis.com/v1')

    #we don't need to write its implied.
    begin
      new(ticker: symbol, name: client.company(symbol).company_name,last_price: client.price(symbol))
    rescue => exception
      nil
    end
  end

end

