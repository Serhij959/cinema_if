Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root "movies#index"
    resources :movies
    resources :screenings
    resources :announcements
    resources :promotions
    resources :users, only: [ :index ] do
      member do
        patch :remove_moderator
      end
      collection do
        post :add_moderator
      end
    end
  end

  scope "(:locale)", locale: /uk|en/ do
    root "home#index"

    get "booking/:movie/:time", to: "bookings#show", as: "booking"
    post "bookings/checkout", to: "bookings#checkout", as: "checkout_bookings"

    get "ticket/:token", to: "bookings#ticket", as: "ticket"
    delete "tickets/:token/cancel", to: "bookings#cancel_ticket", as: "cancel_ticket"
    get "my_tickets", to: "bookings#my_tickets", as: "my_tickets"
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
