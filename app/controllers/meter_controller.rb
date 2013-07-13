class MeterController < ApplicationController
  def index
    ward = GetWard.new(params[:lat], params[:lon]).ward_number
    crimes = GovCrimes.new(ward).number
    @magic_number = CalculateGitto.new(crimes).calculate
  end

  private

  def average(number)
    (100 - (number.to_f / 10_000)*100).to_i
  end
end
