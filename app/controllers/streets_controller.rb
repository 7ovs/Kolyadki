class StreetsController < ApplicationController
  

  # GET /streets/1
  def show
    @street = Street.find(params[:id])
    @locality = @street.locality
    @house = House.new
  end

  # GET /streets/1/edit
  def edit
    @locality = Locality.find(params[:locality_id])
    @street = Street.find(params[:id])
  end

  # POST /streets
  def create
    @locality = Locality.find(params[:locality_id])
    @street = @locality.streets.create(street_params)
    @street.save
    redirect_to @locality
  end

  # PATCH/PUT /streets/1
  def update
    @street = Street.find(params[:id])
    @street.update(street_params)
    @locality = @street.locality

    if @street.save then 
      redirect_to  @street
    else
      render 'edit'
    end      
  end

  # DELETE /streets/1
  def destroy
    @street = Street.find(params[:id])
    @locality = Locality.find(params[:locality_id])
    @street.destroy

    redirect_to @locality
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_street
      @street = Street.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def street_params
      params.require(:street).permit(:localities, :name)
    end
end
