class ReportController < ApplicationController

  def index
    @lat = params[:lat]
    @lon = params[:lon]
    @ward = params[:ward]
  end
end
