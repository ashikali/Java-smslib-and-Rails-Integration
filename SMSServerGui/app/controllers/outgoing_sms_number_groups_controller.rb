class OutgoingSmsNumberGroupsController < ApplicationController
  # GET /outgoing_sms_number_groups
  # GET /outgoing_sms_number_groups.xml
  def index
    @outgoing_sms_number_groups = OutgoingSmsNumberGroup.paginate( :all,:page => params[ :page ], :order => 'created_at', :per_page => 5 )
    session[ :notice ] = "Total No of SMS Number group is #{@outgoing_sms_number_groups.total_entries}"
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @outgoing_sms_number_groups }
    end
  end

  # GET /outgoing_sms_number_groups/1
  # GET /outgoing_sms_number_groups/1.xml
  def show
    @outgoing_sms_number_group = OutgoingSmsNumberGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @outgoing_sms_number_group }
    end
  end

  # GET /outgoing_sms_number_groups/new
  # GET /outgoing_sms_number_groups/new.xml
  def new
    @outgoing_sms_number_group = OutgoingSmsNumberGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @outgoing_sms_number_group }
    end
  end

  # GET /outgoing_sms_number_groups/1/edit
  def edit
    @outgoing_sms_number_group = OutgoingSmsNumberGroup.find(params[:id])
  end

  # POST /outgoing_sms_number_groups
  # POST /outgoing_sms_number_groups.xml
  def create
    @outgoing_sms_number_group = OutgoingSmsNumberGroup.new(params[:outgoing_sms_number_group])

    respond_to do |format|
      if @outgoing_sms_number_group.save
        flash[:notice] = 'OutgoingSmsNumberGroup was successfully created.'
        format.html { redirect_to(@outgoing_sms_number_group) }
        format.xml  { render :xml => @outgoing_sms_number_group, :status => :created, :location => @outgoing_sms_number_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @outgoing_sms_number_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /outgoing_sms_number_groups/1
  # PUT /outgoing_sms_number_groups/1.xml
  def update
    @outgoing_sms_number_group = OutgoingSmsNumberGroup.find(params[:id])

    respond_to do |format|
      if @outgoing_sms_number_group.update_attributes(params[:outgoing_sms_number_group])
        flash[:notice] = 'OutgoingSmsNumberGroup was successfully updated.'
        format.html { redirect_to(@outgoing_sms_number_group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @outgoing_sms_number_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /outgoing_sms_number_groups/1
  # DELETE /outgoing_sms_number_groups/1.xml
  def destroy
    @outgoing_sms_number_group = OutgoingSmsNumberGroup.find(params[:id])
    @outgoing_sms_number_group.destroy

    respond_to do |format|
      format.html { redirect_to(outgoing_sms_number_groups_url) }
      format.xml  { head :ok }
    end
  end
end
