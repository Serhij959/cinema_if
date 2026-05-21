class TicketMailer < ApplicationMailer
  def ticket_email(user, ticket_token)
    @user = user
    @ticket_token = ticket_token
    @bookings = user.bookings.includes(screening: [:movie, :hall]).where(ticket_token: ticket_token)
    
    return if @bookings.empty?
    
    @screening = @bookings.first.screening
    @movie = @screening.movie
    @hall = @screening.hall
    
    mail(to: @user.email, subject: I18n.t("booking.ticket_email_subject"))
  end
end
