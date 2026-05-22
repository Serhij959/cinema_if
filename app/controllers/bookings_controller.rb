class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:checkout, :my_tickets, :cancel_ticket]

  def show
    @screening = Screening.find_by(id: params[:screening_id])

    if @screening.nil?
      movie = Movie.find_by(title: params[:movie]) || Movie.find_by(title_en: params[:movie])

      @screening = Screening
        .joins(:hall)
        .find_by(
          movie: movie,
          show_time: params[:time],
          format: params[:format],
          halls: { name: params[:hall] }
        ) if movie
    end

    unless @screening
      redirect_to root_path(locale: I18n.locale), alert: t("booking.screening_not_found")
      return
    end

    @movie = @screening.movie
    @hall = @screening.hall

    @movie_title = localized_title(@movie)
    @time = @screening.show_time
    @format = @screening.format
    @hall_name = @hall.name
    @price = @screening.price

    @movie_info = {
      poster: @movie.poster,
      description: localized_description(@movie)
    }

    @rows = (1..@hall.rows).to_a
    @seats_per_row = @hall.seats_per_row

    @booked_seats = Booking
      .where(screening: @screening, status: "paid")
      .pluck(:row_number, :seat_number)
  end

  def checkout
    screening = Screening.find(params[:screening_id])
    selected_seats = JSON.parse(params[:selected_seats])
    ticket_token = SecureRandom.uuid

    selected_seats.each do |seat|
      Booking.create!(
        user: current_user,
        screening: screening,
        row_number: seat["row"].to_i,
        seat_number: seat["seat"].to_i,
        price: screening.price,
        status: "paid",
        ticket_token: ticket_token
      )
    end

    TicketMailer.ticket_email(current_user, ticket_token).deliver_now

    redirect_to ticket_path(locale: I18n.locale, token: ticket_token),
      notice: t("booking.email_sent")
  end

  def my_tickets
    @orders = current_user.bookings
      .includes(screening: [:movie, :hall])
      .order(created_at: :desc)
      .group_by(&:ticket_token)
  end

  def cancel_ticket
    bookings = current_user.bookings.where(ticket_token: params[:token])

    if bookings.empty?
      redirect_to my_tickets_path(locale: I18n.locale), alert: t("booking.ticket_not_found")
      return
    end

    bookings.update_all(status: "cancelled")

    redirect_to my_tickets_path(locale: I18n.locale), notice: t("booking.ticket_cancelled")
  end

  def ticket
    @ticket_token = params[:token]

    @bookings = Booking
      .includes(screening: [:movie, :hall])
      .where(ticket_token: @ticket_token)

    if @bookings.empty?
      redirect_to root_path(locale: I18n.locale), alert: t("booking.ticket_not_found")
      return
    end

    @first_booking = @bookings.first
    @screening = @first_booking.screening
    @movie = @screening.movie
    @hall = @screening.hall
    @user = @first_booking.user
  end

  private

  def localized_title(movie)
    if I18n.locale == :en && movie.title_en.present?
      movie.title_en
    else
      movie.title
    end
  end

  def localized_description(movie)
    if I18n.locale == :en && movie.description_en.present?
      movie.description_en
    else
      movie.description
    end
  end
end