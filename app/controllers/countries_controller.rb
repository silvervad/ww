class CountriesController < ApplicationController

  before_action :set_country, only: [ :show ]
  
  def show
    @spots = @country.spots
    @markers = @spots.map do |s|
      [ s.name, s.latitude, s.longitude, country_spot_url(@country, s) ]
    end
    gon.markers = @markers
    gon.country = @country.name
  end
  
  def index
    @countries=Country.all
  end
  
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.friendly.find(params[:id])
    end
end
