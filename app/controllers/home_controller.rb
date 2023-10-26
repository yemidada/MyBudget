class HomeController < ApplicationController
  def index
    redirect_to groups_path unless current_user&.id
  end
end
