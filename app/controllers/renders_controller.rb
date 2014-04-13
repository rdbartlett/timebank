class RendersController < ApplicationController
  # GET /renders
  # GET /renders.json
  def index
    @renders = Render.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @renders }
    end
  end

  # GET /renders/1
  # GET /renders/1.json
  def show
    @render = Render.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @render }
    end
  end

  # GET /renders/new
  # GET /renders/new.json
  def new
    @render = Render.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @render }
    end
  end

  # GET /renders/1/edit
  def edit
    @render = Render.find(params[:id])
  end

  # POST /renders
  # POST /renders.json
  def create
    @render = Render.new(params[:render])

    respond_to do |format|
      if @render.save
        format.html { redirect_to @render, notice: 'Render was successfully created.' }
        format.json { render json: @render, status: :created, location: @render }
      else
        format.html { render action: "new" }
        format.json { render json: @render.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /renders/1
  # PUT /renders/1.json
  def update
    @render = Render.find(params[:id])

    respond_to do |format|
      if @render.update_attributes(params[:render])
        format.html { redirect_to @render, notice: 'Render was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @render.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /renders/1
  # DELETE /renders/1.json
  def destroy
    @render = Render.find(params[:id])
    @render.destroy

    respond_to do |format|
      format.html { redirect_to renders_url }
      format.json { head :no_content }
    end
  end
end
