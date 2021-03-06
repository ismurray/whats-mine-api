# frozen_string_literal: true

class ItemsController < ProtectedController
  before_action :set_item, only: %i[show update destroy]

  # GET /items
  def index
    @items = if params[:search]
               current_user.items.search_for(params[:search])
             else
               current_user.items.all
             end

    render json: @items
  end

  # GET /items/1
  def show
    render json: @item
  end

  # POST /items
  def create
    @box = current_user.boxes.find(item_params[:box_id])
    @item = @box.items.create(item_params)
    @item[:user_id] = current_user[:id]

    if @item.save
      render json: @item, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = current_user.items.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def item_params
    params.require(:item).permit(:name, :value, :user_id, :box_id,
                                 :search)
  end
end
