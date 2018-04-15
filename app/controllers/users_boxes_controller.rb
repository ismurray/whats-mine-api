# frozen_string_literal: true

class UsersBoxesController < ApplicationController
  before_action :set_users_box, only: [:show, :update, :destroy]

  # GET /users_boxes
  def index
    @users_boxes = UsersBox.all

    render json: @users_boxes
  end

  # GET /users_boxes/1
  def show
    render json: @users_box
  end

  # POST /users_boxes
  def create
    @users_box = UsersBox.new(users_box_params)

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
      @users_box = UsersBox.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def users_box_params
      params.require(:users_box).permit(:user_id, :box_id, :write_access)
    end
end
