Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  #get 'posts/index'
  get 'posts/new'
  devise_for :alumni, controllers: {registrations: 'registrations'}
  devise_scope :alumnus do
    get '/almost-done' => 'registrations#almost_done', as: 'almost_done'
    post '/complete-profile' => 'registrations#complete_profile', as: 'complete_profile'
    get '/otp' => 'registrations#otp', as: 'otp'
    get '/otp/send' => 'registrations#send_otp', as: 'send_otp'
    post '/check-otp' => 'registrations#check_otp', as: 'check_otp'
  end
  root to: 'pages#index'
  get '/registrations' => 'alumni#index', as: 'alumni'
end
