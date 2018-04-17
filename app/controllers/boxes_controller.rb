# frozen_string_literal: true

class BoxesController < ProtectedController
  before_action :set_box, only: %i[show update destroy]

  # GET /boxes
  def index
    @boxes = current_user.boxes.all

    render json: @boxes
  end

  # GET /boxes/1
  def show
    render json: @box
  end

  # POST /boxes
  def create
    @box = current_user.boxes.build(box_params)

    if @box.save
      render json: @box, status: :created
    else
      render json: @box.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /boxes/1
  def update
    if @box.update(box_params)
      render json: @box
    else
      render json: @box.errors, status: :unprocessable_entity
    end
  end

  # DELETE /boxes/1
  def destroy
    # find the users_box entry for the current Box and the current user
    @users_box = @box.users_boxes.where(user_id: current_user.id).first
    # check whether the user has write access, if yes, destroy the box, if no
    # delete their read access to the Box, so it is removed from their list
    if @users_box[:write_access]
      @box.destroy
    else
      @users_box.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_box
      @box = current_user.boxes.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def box_params
      params.require(:box).permit(:name, :user_id)
    end
end
