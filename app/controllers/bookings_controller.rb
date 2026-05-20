require Rails.root.join("app/services/cinema_halls")
class BookingsController < ApplicationController

  def show

    @movie_title = params[:movie]
    @time = params[:time]
    @format = params[:format]
    @hall_name = params[:hall]

    @movie_info = find_movie(@movie_title)

    @hall = CinemaHalls.find(@hall_name)

    @rows = (1..@hall[:rows]).to_a
    @seats_per_row = @hall[:seats_per_row]

    @booked_seats = []

  end

  private

  def find_movie(title)

    CinemaSchedule.all_days
      .flat_map { |day| day[:movies] }
      .find { |movie| movie[:title] == title }

  end

end