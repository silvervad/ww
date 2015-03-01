class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]
  before_action :set_country

  # GET /spots
  # GET /spots.json
  def index
    @spots = @country.spots
    gon.mapspots = @spots
  end

  # GET /spots/1
  # GET /spots/1.json
  def show
    @photos = @spot.photos.all
    @schools = @spot.schools.all
    gon.mapspots = @spot

    if request.path != country_spot_path(@country, @spot)
      return redirect_to [@country, @spot], :status => :moved_permanently
    end
    
    #@seasons = @spot.seasons.first.collection.split(',').collect!
  end

  # GET /spots/new
  def new
    @spot = Spot.new
    @photos = @spot.photos.build
  end

  # GET /spots/1/edit
  def edit
    @photos = @spot.photos.all
    #unless @photos.exists? 
     # @photos = Photo.create
    #end
  end

  # POST /spots
  # POST /spots.json
  def create
    @spot = Spot.new(spot_params)

    respond_to do |format|
      if @spot.save
        if params[:photos]
          params[:photos]['image'].each do |a|
            @photo = @spot.photos.create!(:image => a, :imageable_id => @spot.id)
          end
        end
        format.html { redirect_to [@country,@spot], notice: "Spot was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /spots/1
  # PATCH/PUT /spots/1.json
  def update
    params[:spot][:sport_ids] ||= [] 
    respond_to do |format|
      if @spot.update(spot_params)
        if params[:photos]
          params[:photos]['image'].each do |a|
            @photo = @spot.photos.create!(:image => a, :imageable_id => @spot.id)
          end
        end

        format.html { redirect_to [ @country, @spot ] , notice: 'Spot was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /spots/1
  # DELETE /spots/1.json
  def destroy
    @spot.destroy
    respond_to do |format|
      format.html { redirect_to country_spots_url(@country), notice: 'Spot was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spot
      @spot = Spot.friendly.find(params[:id])
    end
    
    def set_country
      @country = Country.friendly.find(params[:country_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spot_params
      params.require(:spot).permit(:name, :latitude, :longitude, :seasons, :country_id, {:sport_ids => []},
        photos_attributes: [:id, :image, :imageable_id])
    end
end
