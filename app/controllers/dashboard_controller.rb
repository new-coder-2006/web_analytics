class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @visits = current_user.visits.group(:page_url).count
    @average_durations = current_user.visits.group(:page_url).average(:duration)
  end
end
