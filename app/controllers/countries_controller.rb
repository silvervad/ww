class CountriesController < ApplicationController

  before_action :set_country, only: [ :show ]
  
  def show
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
