class MeterController < ApplicationController
  def index
    @lat = params[:lat]
    @lon = params[:lon]
    @ward = GetWard.new(@lat, @lon).ward_number
    crimes = GovCrimes.new(@ward).number
    @magic_number = CalculateGitto.new(crimes).calculate
  end

  def show
    @lat = params[:lat]
    @lon = params[:lon]
    @ward = params[:ward]
    @crimes = GovCrimesList.new(@ward).last_crimes
  end

end
