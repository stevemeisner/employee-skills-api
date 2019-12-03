Rails.application.routes.draw do
  resources :employees
  resources :skills
  
  get '/tagged', to: "employees#tagged", as: :tagged
end
