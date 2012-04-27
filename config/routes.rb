require 'resque/server'

JsbloggerCodemash::Application.routes.draw do
  resources :articles
  resources :comments
  resource  :dashboard
  
  match '/' => 'dashboard#show'
  mount Resque::Server.new, :at => "/resque"
end
