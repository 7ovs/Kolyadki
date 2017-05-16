class AppartamentsController < ApplicationController
 
  def show
    @appartament = Appartament.find params[:id]
    @path_to_appartament = get_path + [@appartament]
    @comment = Comment.new
    @path_back = get_path
  end

  # GET /appartaments/new
  def new
    @appartament = Appartament.new 
  end

  def edit
    @appartament = Appartament.find(params[:id])
    @path_to_appartament = get_path + [@appartament]
    @path_back = get_path + [@appartament]
  end

  def create
    house = House.find(params[:house_id])
    @appartament = house.appartaments.create appartament_params
    redirect_to locality_street_house_path *get_path
  end

  def update
    @appartament = Appartament.find params[:id]
    @appartament.update(appartament_params)
    if @appartament.save then 
      redirect_to locality_street_house_appartament_path *get_path, @appartament
    else
      render 'edit'
    end      
  end

  def destroy
    @appartament = Appartament.find params[:id]
    @appartament.destroy
    redirect_to locality_street_house_path *get_path
  end

  def get_path
    house = @appartament.house
    street = house.street
    locality = street.locality
    [locality, street, house]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appartament
      @appartament = Appartament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appartament_params
      params.require(:appartament).permit(:number, :house_id)
    end
end
