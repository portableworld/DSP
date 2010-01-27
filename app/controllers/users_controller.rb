class UsersController < ApplicationController
layout "show_content"

  before_filter :get_user_id
  def index
    @show_date = ShowdateLink.find_by_user_id(@user)
    if @show_date == nil
      s = ShowdateLink.new
      s.user_id = current_user.id
      s.showdate = Date.today
      s.save!
      @show_date = ShowdateLink.find_by_user_id(@user)
    end
    
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
  
  def contents
    @content = @user.contents
  end
  
  # render new.rhtml
  def new
  end
  
  def show
    @content = @user.contents
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end
  
  def content_add
	# Should first check params to see if incoming content is 'Content' or 'Link'	
	unless params[:content].empty? then
		@content = Content.find(params[:content])
		@link = ""
	else
		@link = Link.find(params[:link])
		@content = ""
	end
	
	# Get date of the show the content is for
    @show_date = ShowdateLink.find_by_user_id(@user)
	
	# Start up new Compilation and then populate it
    c = Compilation.new  
    c.user_id = current_user.id
    c.content_id = @content.id unless @content.empty? # Only populates c if there's anything in @content
	c.link_id = @link.id unless @link.empty? # Same as above
    c.show_date = @show_date.showdate
    c.save!
	
	# Bounce back nothing. 
    render :nothing => true
  end

  def content_delete
	# Should first check params to see if incoming content is 'Content' or 'Link'	
	unless params[:content].empty? then
		@content = Compilation.find_all_by_content_id_and_user_id(params[:content], current_user.id)
		@content[0].destroy
	else
		@link = Compilation.find_all_by_link_id_and_user_id(params[:link], current_user.id)
		@link[0].destroy
	end
	
	# Bounce back nothing
    render :nothing => true
  end

	# This def is marked for deletion
  def link_add
    @link = Link.find(params[:link])
    @show_date = ShowdateLink.find_by_user_id(@user)
    l = Linkalation.new

    l.user_id = current_user.id
    l.link_id = @link.id
    l.show_date = @show_date.showdate
    l.save!

    render :nothing => true
  end

	# This def is marked for deletion
  def link_delete
    @linkalation = Linkalation.find_by_link_id_and_user_id(params[:link], current_user.id)

    @linkalation[0].destroy

    render :nothing => true
  end

  def update_showdate
    @showdate = params[:showdate]

    ShowdateLink.update_all(['"showdate"=?', @showdate], ['"user_id"=?', current_user.id])

    render :nothing => true
  end

  def sort 
    params[:sortable_show].each_with_index do |id,index|
      @to_update = Compilation.find_all_by_content_id_and_user_id(id, current_user.id)
      Compilation.update_all(['"order"=?', index+1], ['"id"=?', @to_update[0].id])
    end

    render :nothing => true
  end

protected

# I wrote this but I don't seem to be using it. 
# Start using it or trash it.
def get_user_id
  if current_user
  @user = User.find(current_user.id)
  end
end
end
