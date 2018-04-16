# frozen_string_literal: true

class UsersBoxesController < ProtectedController
  before_action :set_users_box, only: %i[update destroy]

  # GET /users_boxes
  def index
    @users_boxes = current_user.users_boxes.all

    render json: @users_boxes
  end

  # GET /users_boxes/1
  def show
    # no longer filters using set_users_box so that userA can see other userB's
    # permissions on a Box userA owns
    @users_box = UsersBox.find(params[:id])
    render json: @users_box
  end

  # POST /users_boxes
  def create
    # first, build the UsersBox entry normally to ensure that the current user
    # has write access for the given Box, then change the user_id of @users_box
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
    return false unless current_user_has_write_access?
    @users_box = UsersBox.find(params[:id])
  end

  # Returns true if the current user has write access in the given Box
  def current_user_has_write_access?
    @current_box = UsersBox.find(params[:id]).box
    @current_user_permission = @current_box.users_boxes
                                           .where(user_id: current_user[:id])
                                           .first
    @current_user_permission[:write_access]
  end

  # Only allow a trusted parameter "white list" through.
  def users_box_params
    p 'original params are ', params
    params.require(:users_box).permit(:user_id, :box_id, :write_access)
  end
end
