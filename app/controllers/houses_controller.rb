class HousesController < ApplicationController
  

  def show
    @house = House.find(params[:id])
    @comment = Comment.new
    if @house.liability == "Блок"
      @appartament = Appartament.new
      @path_to_appartament = get_path + [@house]
    else
      @appartament = Appartament.find_or_create_by(house_id: params[:id], number: @house.number)
      @appartament.save
      @path_to_appartament = get_path + [@house] +[@appartament]
    end
  end

  def new
    @house = House.new
  end

  def edit
    @house = House.find(params[:id])
    @path_to_appartament = get_path + [@house]
  end

  def create
    @street = Street.find params[:street_id]
    @house = @street.houses.create(house_params)
    redirect_to locality_street_path(*get_path)
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    @house = House.find params[:id]
    @house.update(house_params)
    if @house.save then 
      redirect_to locality_street_house_path *get_path, @house
    else
      render 'edit'
    end      
  end

  def instant_add_to_private
    @street = Street.find params[:id]
    @comment = Comment.new
    render template: 'streets/instant_form'
  end

  def add_comment
    @house = House.find params[:id]
    @appartament = Appartament.find_or_create_by(number: params[:number], house_id: params[:id])
    @appartament.save
    @comment = @appartament.comments.create(offering: params[:offering], comment: params[:comment], date: Time.now, open: params[:open])
    @comment.save
    redirect_to instant_add_path @house
  end

  def instant_add
    @house = House.find params[:id]
    @comment = Comment.new
    render template: 'houses/instant_form'
  end



  def add_comment_to_private
    @street = Street.find params[:id]
    @house = House.find_or_create_by(
      number: params[:number], 
      street_id: params[:id], 
      liability: "Частный дом"
    )
    @house.save 
    @appartament = @house.appartaments.find_or_create_by(number: params[:number])       
    @appartament.save
    @comment = @house.appartaments[0].comments.create(
      offering: params[:offering], 
      comment: params[:comment], 
      date: Time.now, 
      open: params[:open]
    )
    @comment.save
    redirect_to instant_add_private_path @street
  end

  def destroy
    @house = House.find params[:id]
    @house.destroy
    redirect_to locality_street_path *get_path
  end

  def get_path
    [@house.street.locality, @house.street]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:number, :street_id, :liability)
    end

end
