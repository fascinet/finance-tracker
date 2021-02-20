class StocksController < ApplicationController

  def search
    @stock = Stock.look_up(params[:stock])
    render 'users/my_portfolio'
  end
end
