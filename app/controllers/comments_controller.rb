class CommentsController < ApplicationController

  def show
    @comment = Comment.find params[:id]
    @path_to_comment = get_path + [@comment]
    @path_back = get_path
  end

  def new
    @comment = Comment.new
    @path_to_comments = get_path
  end

  def edit
    @comment = Comment.find(params[:id])
    @path_to_comment = get_path + [@comment]
  end

  def create
    appartament = Appartament.find(params[:appartament_id])
    @comment = appartament.comments.create comment_params
    redirect_to locality_street_house_appartament_path *get_path
  end

  def update
    @comment = Comment.find params[:id]
    @comment.update(comment_params)
    if @comment.save then 
      redirect_to locality_street_house_appartament_comment_path *get_path, @comment
    else
      render 'edit'
    end      
  end


  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to locality_street_house_appartament_path *get_path
  end

  def get_path
    appartament = @comment.appartament
    house = appartament.house
    street = house.street
    locality = street.locality
    [locality, street, house, appartament]
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:appartament_id, :offering, :comment, :date)
    end
end
