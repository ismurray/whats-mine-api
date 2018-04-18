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
    # if current_user has write permissions on the current box
    @current_box = Box.find(users_box_params[:box_id])
    if current_user_has_write_access?(@current_box)
      # find the target user by email and create the UsersBox
      @users_box = UsersBox.create(
        box_id: users_box_params[:box_id],
        write_access: users_box_params[:write_access],
        user_id: User.find_by(email: users_box_params[:email]).id
      )
    end

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
  # if the deleting user has write access on the Box, they can delete anyone's
  # permisssions. Otherwise, they can only delete their own.
  def destroy
    @users_box = if set_users_box
                   UsersBox.find(params[:id])
                 else
                   current_user.users_boxes.find(params[:id])
                 end
    @users_box.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_users_box
    # finds the box entry of the permission User is trying to modify
    @current_box = UsersBox.find(params[:id]).box
    return false unless current_user_has_write_access?(@current_box)
    @users_box = UsersBox.find(params[:id])
  end

  # Returns true if the current user has write access in the given Box
  def current_user_has_write_access?(current_box)
    # finds the User's permission entry for the current box
    @current_user_permission = current_box.users_boxes
                                          .where(user_id: current_user[:id])
                                          .first
    # returns the User's write access in the current box (T/F)
    @current_user_permission[:write_access]
  end

  # Only allow a trusted parameter "white list" through.
  def users_box_params
    params.require(:users_box).permit(:email, :box_id, :write_access)
  end
end
