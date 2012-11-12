class VenuesController < ApplicationController
  # GET /venues
  # GET /venues.json

  before_filter :authenticate_user_or_admin!, :only => [:update]
  before_filter :authenticate_admin!, :only => [:new, :edit, :destroy]

  def index
    @venues = Venue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @venues }
    end
  end

  # GET /venues/1
  # GET /venues/1.json
  def show
    @venue = Venue.find(params[:id])
    @reviews = @venue.reviews
    @json = Venue.find(params[:id]).to_gmaps4rails



    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @venue }

    end
  end

  # GET /venues/new
  # GET /venues/new.json
  def new
    @venue = Venue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @venue }
    end
  end

  # GET /venues/1/edit
  def edit
    @venue = Venue.find(params[:id])
  end

  # POST /venues
  # POST /venues.json
  def create
   @doc = Nokogiri::HTML(open('http://ratings.food.gov.uk/OpenDataFiles/FHRS760en-GB.xml'))
    @establishmentdetails = @doc.xpath('//establishmentdetail')
    @establishmentdetails.each do |establishmentdetail|
    if establishmentdetail.at("businesstypeid").text =='7843'
      @venue = Venue.find_or_initialize_by_business_id(establishmentdetail.at_xpath("fhrsid").text)
      @venue.update_attributes(
      :name => establishmentdetail.at_xpath("businessname").text,
      :address1 => establishmentdetail.at_xpath("addressline1").nil? ? '': establishmentdetail.at_xpath("addressline1").text,
      :address2 => establishmentdetail.at_xpath("addressline2").nil? ? '': establishmentdetail.at_xpath("addressline2").text,
      :address3 => establishmentdetail.at_xpath("addressline3").nil? ? '': establishmentdetail.at_xpath("addressline3").text,
      :address4 => establishmentdetail.at_xpath("addressline4").nil? ? '': establishmentdetail.at_xpath("addressline4").text,
      :postcode => establishmentdetail.at_xpath("postcode").nil? ? '': establishmentdetail.at_xpath("postcode").text,
      # :address => establishmentdetail.at_xpath("postcode").nil? ? '': establishmentdetail.at_xpath("postcode").text,
      :health_rating => establishmentdetail.at_xpath("ratingvalue").nil? ? '': establishmentdetail.at_xpath("ratingvalue").text,
      :health_rating_date => establishmentdetail.at_xpath("ratingdate").nil? ? '': establishmentdetail.at_xpath("ratingdate").text,
      #:longitude=> establishmentdetail.at_xpath("//longitude").nil? ? '': establishmentdetail.at_xpath("//longitude").text,
      #:latitude => establishmentdetail.at_xpath("//latitude").nil? ? '': establishmentdetail.at_xpath("//latitude").text,
      :business_id =>establishmentdetail.at_xpath("fhrsid").text
    )
      end
  end
   redirect_to root_path
  end

  # PUT /venues/1
  # PUT /venues/1.json
  def update
    @venue = Venue.find(params[:id])

    respond_to do |format|
      if @venue.update_attributes(params[:venue])
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy

    respond_to do |format|
      format.html { redirect_to venues_url }
      format.json { head :no_content }
    end
  end
end
