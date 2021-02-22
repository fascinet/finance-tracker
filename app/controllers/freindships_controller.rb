class FreindshipsController < ApplicationController
  def create
    friend = User.find(params[:freind])
    current_user.freindships.build(freind_id: friend.id)
    if current_user.save
      flash[:notice] = "Following Friends"
    else
      flash[:alert] = "There was something wrong with the request"
    end
    redirect_to my_friends_path
  end

  def destroy
    freindship = current_user.freindships.where(freind_id: params[:id]).first
    freindship.destroy
    flash[:notice] = "Stopped Following"
    redirect_to my_friends_path
  end
end
