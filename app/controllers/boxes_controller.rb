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
    @box.destroy
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
