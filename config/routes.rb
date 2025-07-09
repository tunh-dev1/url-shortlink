Rails.application.routes.draw do
  post '/encode', to: 'urls#encode'
  get '/decode/:shorted_url', to: 'urls#decode'
end
