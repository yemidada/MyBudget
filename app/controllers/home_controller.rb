class HomeController < ApplicationController
  def index
    redirect_to groups_path if current_user&.id
  end
end
