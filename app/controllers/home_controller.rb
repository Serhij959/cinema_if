class HomeController < ApplicationController
  def index
    @days = CinemaSchedule.days
    @announcements = CinemaAnnouncements.all
    @promotions = CinemaPromotions.all
  end
end