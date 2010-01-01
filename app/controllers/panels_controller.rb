class PanelsController < ApplicationController

  before_filter :get_user_id
  # GET /panels
  # GET /panels.xml
  def index

    if @user.admin == false
      @panels = Panel.all(:order => 'date_made DESC', :conditions => {:live_state => "Live"})
    else
      @panels = Panel.all(:order => 'date_made DESC')
    end
    @visuals = Visualization.find_all_by_user_id(@user)
    @compiles = Compilation.find_all_by_user_id(@user)
    @links = Linkalation.find_all_by_user_id(@user)

    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @panels }
    end
  end

  # GET /panels/1
  # GET /panels/1.xml
  def show
    @panel = Panel.find(params[:id])
    @contents = @panel.contents.all(:order => '"order"')
    @links = @panel.links.all(:order => '"order"')
    @links_count = @panel.links.count
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @panel }
    end
  end

  # GET /panels/new
  # GET /panels/new.xml
  def new
    @panel = Panel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @panel }
    end
  end

  # GET /panels/1/edit
  def edit
    @panel = Panel.find(params[:id])
  end

  # POST /panels
  # POST /panels.xml
  def create
    @panel = Panel.new(params[:panel])

    respond_to do |format|
      if @panel.save
        flash[:notice] = 'Panel was successfully created.'
        format.html { redirect_to(@panel) }
        format.xml  { render :xml => @panel, :status => :created, :location => @panel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @panel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /panels/1
  # PUT /panels/1.xml
  def update
    @panel = Panel.find(params[:id])

    respond_to do |format|
      if @panel.update_attributes(params[:panel])
        flash[:notice] = 'Panel was successfully updated.'
        format.html { redirect_to(@panel) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @panel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /panels/1
  # DELETE /panels/1.xml
  def destroy
    @panel = Panel.find(params[:id])
    @panel.destroy

    respond_to do |format|
      format.html { redirect_to(panels_url) }
      format.xml  { head :ok }
    end
  end
  
  def sort
    @type = params[:type]
    if @type == "content"
       params[:contents].each_with_index do |id, index|
          Content.update_all(['"order"=?', index+1], ['"id"=?', id])
      end
    end
    
    if @type == "link"
      params[:links].each_with_index do |id, index|
          Link.update_all(['"order"=?', index+1], ['"id"=?', id])
      end
    end
      
    render :nothing => true
  end

  def add_visuals
    @panel_id = params[:panel_id]

    v = Visualization.new
    v.panel_id = @panel_id
    v.user_id = current_user.id
    v.save!

    render :nothing => true
  end

  protected

def get_user_id
  if current_user
  @user = User.find(current_user.id)
  end
end
end
