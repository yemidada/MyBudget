class GroupsController < ApplicationController
  before_action :set_recipe, only: %i[show destroy]
  before_action :authenticate_user!

  def index
    @groups = Group.where(user_id: current_user.id)
  end

  def show
    # show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(recipe_params)
    @group.user_id = current_user.id
    if @group.save
      redirect_to root_path, notice: 'Add new group'
    else
      render :new
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to root_path, notice: 'Group was successfully deleted.'
  end

  private

  def set_recipe
    @group = Group.find(params[:id])
  end

  def recipe_params
    params.require(:group).permit(:name, :icon)
  end
end
