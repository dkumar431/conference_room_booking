class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user.role == "client"
      render '/dashboards/partials/client_dashboard'
    elsif current_user.role == "manager"
      render '/dashboards/partials/manager_dashboard'
    else
      redirect_to new_user_session_path
    end
  end

end
