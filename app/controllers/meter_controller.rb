class MeterController < ApplicationController
  def index
    # params[:lon], params[:lat]
    crimes = GovCrimes.new(34).number
    @magic_number = CalculateGitto.new(crimes).calculate
  end

  private

  def average(number)
    (100 - (number.to_f / 10_000)*100).to_i
  end
end
