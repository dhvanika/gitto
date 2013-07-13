class GittosController < ApplicationController
  include HTTParty
  # GET /gittos
  # GET /gittos.json
  def index
    url = "https://data.cityofchicago.org/resource/x2n5-8w5q.json"
    options = { :body => {:status => text}, :basic_auth => @auth }
    @response = HTTParty.get(url, options)

    @crime = Hash.new

    #@crime['block'] = @response[0]['block']
    @crime = @response

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gittos }
    end
  end

  # GET /gittos/1
  # GET /gittos/1.json
  def show
    @gitto = Gitto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gitto }
    end
  end

  # GET /gittos/new
  # GET /gittos/new.json
  def new
    @gitto = Gitto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gitto }
    end
  end

  # GET /gittos/1/edit
  def edit
    @gitto = Gitto.find(params[:id])
  end

  # POST /gittos
  # POST /gittos.json
  def create
    @gitto = Gitto.new(params[:gitto])

    respond_to do |format|
      if @gitto.save
        format.html { redirect_to @gitto, notice: 'Gitto was successfully created.' }
        format.json { render json: @gitto, status: :created, location: @gitto }
      else
        format.html { render action: "new" }
        format.json { render json: @gitto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gittos/1
  # PUT /gittos/1.json
  def update
    @gitto = Gitto.find(params[:id])

    respond_to do |format|
      if @gitto.update_attributes(params[:gitto])
        format.html { redirect_to @gitto, notice: 'Gitto was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gitto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gittos/1
  # DELETE /gittos/1.json
  def destroy
    @gitto = Gitto.find(params[:id])
    @gitto.destroy

    respond_to do |format|
      format.html { redirect_to gittos_url }
      format.json { head :no_content }
    end
  end
end
