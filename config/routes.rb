Rails.application.routes.draw do
  devise_for :users

  scope "(:locale)", locale: /uk|en/ do
    root "home#index"

    get "booking/:movie/:time", to: "bookings#show", as: "booking"
    post "bookings/checkout", to: "bookings#checkout", as: "checkout_bookings"

    get "ticket/:token", to: "bookings#ticket", as: "ticket"
    get "my_tickets", to: "bookings#my_tickets", as: "my_tickets"
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end