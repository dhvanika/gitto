class WelcomeController < ApplicationController
  layout "welcome"

  def index
  end

  def index2
    render 'index', layout: "application"
  end
end
