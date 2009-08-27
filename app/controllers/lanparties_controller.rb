class LanpartiesController < ApplicationController
  # GET /lanparties
  # GET /lanparties.xml
  def index
    @lanparties = Lanparty.find(:all, :order => :start)
    @upcoming_lanparties = Lanparty.find(:all, :conditions => "DATETIME() < end", :order => :start)
    @past_lanparties = Lanparty.find(:all, :conditions => "DATETIME() > end", :order => "start DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lanparties }
      format.atom #{ render :rss => @lanparties }
      format.json { render :json => @lanparties }
      format.ics  { render :text => @lanparties }
    end
  end

  # GET /lanparties/1
  # GET /lanparties/1.xml
  def show
    @lanparty = Lanparty.find(params[:id])

    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    
    if @lanparty.latitude != nil && @lanparty.longitude != nil
      @map.center_zoom_init([@lanparty.latitude.to_f,@lanparty.longitude.to_f],8) 
    else
      @map.center_zoom_init([62.27,15.82],4)  #defaults to Sweden
    end

    if @lanparty.latitude != nil && @lanparty.longitude != nil
        @map.overlay_init(GMarker.new([@lanparty.latitude,@lanparty.longitude],:title => @lanparty.title, :info_window => "<strong><a href=\"/lanparties/#{@lanparty.id}\">#{@lanparty.title}</a></strong><br/>#{@lanparty.description}"))
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lanparty }
    end
  end

  # GET /lanparties/new
  # GET /lanparties/new.xml
  def new
    @lanparty = Lanparty.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lanparty }
    end
  end

  # GET /lanparties/1/edit
  def edit
    @lanparty = Lanparty.find(params[:id])
  end

  # POST /lanparties
  # POST /lanparties.xml
  def create
    @lanparty = Lanparty.new(params[:lanparty])

    respond_to do |format|
      if @lanparty.save
        flash[:notice] = 'Lanparty was successfully created.'
        format.html { redirect_to(@lanparty) }
        format.xml  { render :xml => @lanparty, :status => :created, :location => @lanparty }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lanparty.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lanparties/1
  # PUT /lanparties/1.xml
  def update
    @lanparty = Lanparty.find(params[:id])

    respond_to do |format|
      if @lanparty.update_attributes(params[:lanparty])
        flash[:notice] = 'Lanparty was successfully updated.'
        format.html { redirect_to(@lanparty) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lanparty.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lanparties/1
  # DELETE /lanparties/1.xml
  def destroy
    @lanparty = Lanparty.find(params[:id])
    @lanparty.destroy

    respond_to do |format|
      format.html { redirect_to(lanparties_url) }
      format.xml  { head :ok }
    end
  end

  def calendar
    @lanparties = Lanparty.find(:all, :order => :start)

    if params[:year] != nil

      @year = params[:year].to_i

    else

      @year = Time.now.year

    end

    @next_year = @year
    @prev_year = @year

    if params[:month] != nil

      @month = params[:month].to_i
      if @month == 1
        @prev_month = 12
        @prev_year = @year - 1
      else
        @prev_month = @month - 1
      end

      if @month == 12
        @next_month = 1
        @next_year = @year + 1
      else
        @next_month = @month + 1
      end

    else

      @next_month = Time.now.month + 1
      @prev_month = Time.now.month - 1
      @month = Time.now.month

    end

  end

  def map
    @lanparties = Lanparty.all

    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.center_zoom_init([62.27,15.82],4)  #defaults to Sweden
    
    for @lanparty in @lanparties
      if @lanparty.latitude != nil && @lanparty.longitude != nil
        @map.overlay_init(GMarker.new([@lanparty.latitude,@lanparty.longitude],:title => @lanparty.title, :info_window => "<strong><a href=\"/lanparties/#{@lanparty.id}\">#{@lanparty.title}</a></strong><br/>#{@lanparty.description}"))
      end
    end
    
  end

end
