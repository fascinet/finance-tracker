class Stock < ApplicationRecord

  #to define class methods use self.method name

  def self.look_up(symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:normal_token] ,
      secret_token: Rails.application.credentials.iex_client[:secret_token] ,
      endpoint: 'https://sandbox.iexapis.com/v1')

    #we don't need to write its implied.
    client.price(symbol)
  end

end

