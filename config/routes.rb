Rails.application.routes.draw do
  post '/bugs', to: 'bugs#add'
  get '/bugs/count/:application_token', to: 'bugs#count'
  get '/bugs/:application_token/:number', to: 'bugs#get'
end
