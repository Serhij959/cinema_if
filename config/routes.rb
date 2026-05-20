Rails.application.routes.draw do
  devise_for :users

  scope "(:locale)", locale: /uk|en/ do
    root "home#index"
  end
end