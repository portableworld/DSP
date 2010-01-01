class ShowreadyController < ApplicationController

    before_filter :get_user_id
  def index

  end

  def show
    @show_date = ShowdateLink.find_by_user_id(@user)
    @contents = Compilation.find_all_by_user_id_and_show_date(@user, @show_date.showdate)

    for content in @contents do
      if content.order == nil
        content.order = @contents.length
      end
    end
    
    @contents = @contents.sort_by { |content| content[:order] }

    @show = Array.new
    for content in @contents do
      @picked = Content.find(content.content_id)
      @show << @picked
    end
  end

  protected

  def get_user_id
    if current_user
      @user = User.find(current_user.id)
    end
  end

end
