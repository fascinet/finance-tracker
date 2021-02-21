class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.look_up(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial:'users/result' }
        end
      else
        respond_to do |format|
          flash.now[:alert]= "Please Enter Any Symbol"
          format.js { render partial:'users/result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert]= "Please Enter a Valid Symbol"
        format.js { render partial:'users/result' }
      end
    end
  end
end
