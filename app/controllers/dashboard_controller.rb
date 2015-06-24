class DashboardController < ApplicationController
  before_filter :authenticate

  before_action :set_user

  def overview
  end

  private
  def set_user
    @user = current_user
  end
end
