class MeterController < ApplicationController
  def index
    @lat = params[:lat]
    @lon = params[:lon]
    @ward = GetWard.new(@lat, @lon).ward_number
    crimes = GovCrimes.new(@ward).number
    @magic_number = CalculateGitto.new(crimes).calculate
    @phrase = calculate_phrase(@magic_number)
  end

  def show
    @lat = params[:lat]
    @lon = params[:lon]
    @ward = params[:ward]
    @crimes = GovCrimesList.new(@ward).last_crimes
  end

  private

  def calculate_phrase(number)
    if number > 90
      'Neighborhood Rating: <span> "C-" </span> Stay vigilant! There\'s been a large number of crimes reported in the area'
    elsif number > 50
      'Neighborhood Rating: <span> "B" </span> There have been moderate crimes reported in your current area. Remember, if you see something, say something.'
    else
      'Neighborhood Rating: <span> "A+ </span> It\'s "Posh-ish" - Go ahead, wear your Rolex, but beware of pickpockets & panhandlers.'
    end
  end

end
