class SitesController < ApplicationController
  def index
    @site_visits = Visit.group(:page_url).count
    @average_durations = Visit.group(:page_url).average(:duration)
  end
end
