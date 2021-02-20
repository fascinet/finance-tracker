class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.look_up(params[:stock])
      if @stock
        render 'users/my_portfolio'
      else
        flash[:alert]= "Please Enter a Valid Symbol"
        redirect_to my_portfolio_path
      end
    else
      flash[:alert]= "Please Enter a Valid Symbol"
      redirect_to my_portfolio_path
    end
  end
end
