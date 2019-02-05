class UserPageController < ApplicationController
  def user_show
    i = params[:user_id].to_i
   @user = User.find(i) #params[:id]
  end
end
