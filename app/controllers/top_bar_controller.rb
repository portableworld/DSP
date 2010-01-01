class TopBarController < ApplicationController
  
  def index
    @user = User.find(params[:id])

  end

  def show
    @user = User.find(current_user.id)
    @showdate = ShowdateLink.find_by_user_id(@user)
    if @showdate == nil
      @showdate = Date.today.to_s(:long)
    else
      @showdate = @showdate.showdate.to_s(:long)
    end
  end
end
