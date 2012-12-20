class BilhetesController < ApplicationController
  # GET /bilhetes
  # GET /bilhetes.json
  def index
    @bilhetes = Bilhete.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bilhetes }
    end
  end

  # GET /bilhetes/1
  # GET /bilhetes/1.json
  def show
    @bilhete = Bilhete.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bilhete }
    end
  end

  # GET /bilhetes/new
  # GET /bilhetes/new.json
  def new
    @bilhete = Bilhete.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bilhete }
    end
  end

  # GET /bilhetes/1/edit
  def edit
    @bilhete = Bilhete.find(params[:id])
  end

  # POST /bilhetes
  # POST /bilhetes.json
  def create
    @bilhete = Bilhete.new(params[:bilhete])

    respond_to do |format|
      if @bilhete.save
        format.html { redirect_to @bilhete, notice: 'Bilhete was successfully created.' }
        format.json { render json: @bilhete, status: :created, location: @bilhete }
      else
        format.html { render action: "new" }
        format.json { render json: @bilhete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bilhetes/1
  # PUT /bilhetes/1.json
  def update
    @bilhete = Bilhete.find(params[:id])

    respond_to do |format|
      if @bilhete.update_attributes(params[:bilhete])
        format.html { redirect_to @bilhete, notice: 'Bilhete was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bilhete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bilhetes/1
  # DELETE /bilhetes/1.json
  def destroy
    @bilhete = Bilhete.find(params[:id])
    @bilhete.destroy

    respond_to do |format|
      format.html { redirect_to bilhetes_url }
      format.json { head :no_content }
    end
  end
end
