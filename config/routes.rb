Rails.application.routes.draw do
  root 'index#enter_form'
  get 'index/enter_form'
  get '/result', to: 'index#result'
end