# frozen_string_literal: true

class UsersBoxesController < ProtectedController
  before_action :set_users_box, only: %i[show update destroy]

  # GET /users_boxes
  def index
    @users_boxes = current_user.users_boxes.all

    render json: @users_boxes
  end

  # GET /users_boxes/1
  def show
    render json: @users_box
  end

  # POST /users_boxes
  def create
    # first, build the UsersBox enter normally to ensure that the current user
    # has write entry for the given Box, then change the user_id of @users_box
    # to that of the user passed in the request
    @users_box = current_user.users_boxes.build(users_box_params)
    @users_box[:user_id] = users_box_params[:user_id]

    if @users_box.save
      render json: @users_box, status: :created
    else
      render json: @users_box.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users_boxes/1
  def update
    if @users_box.update(users_box_params)
      render json: @users_box
    else
      render json: @users_box.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users_boxes/1
  def destroy
    @users_box.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_box
      @users_box = current_user.users_boxes.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def users_box_params
      params.require(:users_box).permit(:user_id, :box_id, :write_access)
    end
end
