class ZonesController < ApplicationController
  before_action :set_zone, only: %i[ show edit update destroy ]

  # GET /zones or /zones.json
  def index
    @zones = Zone.all
  end

  # GET /zones/1 or /zones/1.json
  def show
  end

  # GET /zones/new
  def new
    @zone = Zone.new
  end

  # GET /zones/1/edit
  def edit
  end

  # POST /zones or /zones.json
  def create
    @zone = Zone.new(zone_params)
    if @zone.save
      redirect_to @zone, notice: "Zone was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /zones/1 or /zones/1.json
  def update
    if @zone.update(zone_params)
      redirect_to @zone, notice: "Zone was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /zones/1 or /zones/1.json
  def destroy
    @zone.destroy
    redirect_to zones_url, notice: "Zone was successfully destroyed." 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zone
      @zone = Zone.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def zone_params
      params.require(:zone).permit(:name)
    end
end
