class UnitConversionsController < ActionController::Base
  layout 'application'

  def index
    @unit_conversions = UnitConversion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @unit_conversions }
    end
  end

  def show
    redirect_to unit_conversions_url and return
  end

  def new
    @unit_conversion = UnitConversion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @unit_conversion }
    end
  end

  def edit
    @unit_conversion = UnitConversion.find(params[:id])
  end

  def create
    @unit_conversion = UnitConversion.new(params[:unit_conversion])

    respond_to do |format|
      if @unit_conversion.save
        format.html { redirect_to(@unit_conversion, :notice => 'Unit conversion was successfully created.') }
        format.xml  { render :xml => @unit_conversion, :status => :created, :location => @unit_conversion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @unit_conversion.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @unit_conversion = UnitConversion.find(params[:id])

    respond_to do |format|
      if @unit_conversion.update_attributes(params[:unit_conversion])
        format.html { redirect_to(@unit_conversion, :notice => 'Unit conversion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @unit_conversion.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @unit_conversion = UnitConversion.find(params[:id])
    @unit_conversion.destroy

    respond_to do |format|
      format.html { redirect_to(unit_conversions_url) }
      format.xml  { head :ok }
    end
  end
end
