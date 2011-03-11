Filippas::Application.routes.draw do
    devise_for :users, :controllers => {:registrations => "registrations"} 
    devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
    devise_scope :user do
      get '/login' => 'devise/sessions#new'
      get '/logout' => 'devise/sessions#destroy'
    end
    resources :token_authentications, :only => [:create, :destroy]
    resources :user, :controller => "user"
    resources :surveys
    
    namespace :user do
      root :to => "dashboard#userprofile"
    end
        match '/dashboard' => 'dashboard#userprofile', :as => 'user_root'
        match 'user/dashboard', :to => 'dashboard#userprofile'
        match '/userprofile', :to => 'dashboard#userprofile'
        match '/surveys/coupon', :to => 'surveys#coupon'
        match '/surveys/new', :to => 'surveys#new'
        match '/surveys/:id/coupon', :to => 'surveys#coupon'
        match '/contact', :to => 'pages#contact'
        match '/about',   :to => 'pages#about'
        match '/help',    :to => 'pages#help'
        match '/savetoexcel.php',    :to => 'pages#savetoexcel.php'
        match '/privacy', :to => 'pages#privacy'
        match '/hours', :to => 'pages#hours'
        match '/meetings', :to => 'pages#meetings'
        match '/restaurant',   :to => 'pages#restaurant'
        match '/banquet',    :to => 'pages#banquet'
        match '/catering', :to => 'pages#catering'
        match '/events',   :to => 'pages#events'
        match '/blog',    :to => 'pages#blog'
        match '/contact', :to => 'pages#contact'
        match '/menu', :to => 'pages#menu'
        root :to => 'pages#home'
    end
 