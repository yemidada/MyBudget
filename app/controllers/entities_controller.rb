class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show destroy]
  before_action :authenticate_user!

  def index
    # index
  end

  def show
    # show
  end

  def new
    @entity = Entity.new(group_id: params[:group_id])
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.author_id = current_user.id

    if @entity.save
      redirect_to group_path(@entity.group_id), notice: 'Add new transaction'
    else
      render :new
    end
  end

  def destroy
    @entity = Entity.find(params[:id])
    @entity.destroy
    redirect_to entities_path, notice: 'Transaction was successfully deleted.'
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:name, :group_id, :amount)
  end
end
