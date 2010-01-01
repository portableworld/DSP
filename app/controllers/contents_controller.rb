class ContentsController < ApplicationController
  
  before_filter :get_panel
  
  # GET /contents
  # GET /contents.xml
  def index
    @contents = @panel.contents

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contents }
    end
  end

  # GET /contents/1
  # GET /contents/1.xml
  def show
    @content = @panel.contents.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @content }
    end
  end

  # GET /contents/new
  # GET /contents/new.xml
  def new
    @content = @panel.contents.build(params[:content])
    @content_count = @panel.contents.count+1

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @content }
    end
  end

  # GET /contents/1/edit
  def edit
    @content = @panel.contents.find(params[:id])
  end

  # POST /contents
  # POST /contents.xml
  def create
    @content = @panel.contents.build(params[:content])

    @reset_unread = params[:unread]
    if @reset_unread == "Yes"
      @seen_panels = Visualization.find_all_by_panel_id(@panel.id)
      for panel in @seen_panels do
        panel.destroy
      end
    end

    respond_to do |format|
      if @content.save
        format.html { redirect_to(@panel) }
        format.xml  { render :xml => @content, :status => :created, :location => @content }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contents/1
  # PUT /contents/1.xml
  def update
    @content = @panel.contents.find(params[:id])
    @unread = params[:unread]

    if @unread == "Yes"
      @all_reads = Visualization.find(:all, :conditions => {:panel_id => params[:id]})
      for all_read in @all_reads do
        all_read.destroy
      end
    end

    respond_to do |format|
      if @content.update_attributes(params[:content])
        format.html { redirect_to(@panel) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.xml
  def destroy
    @content = @panel.contents.find(params[:id])
    @content.destroy

    respond_to do |format|
      format.html { redirect_to(@panel) }
      format.xml  { head :ok }
    end
  end
  
  # GET /contents/1/popularity
  # Meant to display the popularity of given content
  def popularity
    @content = Content.find(params[:id])
  end
  
  
  private
  
  def get_panel
    @panel = Panel.find(params[:panel_id])
  end
end
