class LinksController < ApplicationController
  
  before_filter :get_panel
  
  # GET /links
  # GET /links.xml
  def index
    @links = @panel.links

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @links }
    end
  end

  # GET /links/1
  # GET /links/1.xml
  def show
    @link = @panel.links.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @link }
    end
  end

  # GET /links/new
  # GET /links/new.xml
  def new
    @link = @panel.links.build(params[:link])
    @link_count = @panel.links.count+1
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @link }
    end
  end

  # GET /links/1/edit
  def edit
    @link = @panel.links.find(params[:id])
  end

  # POST /links
  # POST /links.xml
  def create
    @link = @panel.links.build(params[:link])

    @reset_unread = params[:unread]
    if @reset_unread == "Yes"
      @seen_panels = Visualization.find_all_by_panel_id(@panel.id)
      for panel in @seen_panels do
        panel.destroy
      end
    end
      
    respond_to do |format|
      if @link.save
        format.html { redirect_to(@panel) }
        format.xml  { render :xml => @link, :status => :created, :location => @link }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /links/1
  # PUT /links/1.xml
  def update
    @link = @panel.links.find(params[:id])
    if @unread == "Yes"
      @all_reads = Visualization.find(:all, :conditions => {:panel_id => params[:id]})
      for all_read in @all_reads do
        all_read.destroy
      end
    end
    
    respond_to do |format|
      if @link.update_attributes(params[:link])
        flash[:notice] = 'Link was successfully updated.'
        format.html { redirect_to(@panel) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.xml
  def destroy
    @link = @panel.links.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to(@panel) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def get_panel
    @panel = Panel.find(params[:panel_id])
  end
end
