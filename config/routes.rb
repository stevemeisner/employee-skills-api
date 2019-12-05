Rails.application.routes.draw do
  resources :employees
  resources :skills
  
  patch '/employees/:id/:skill_list', to: "employees#add_skill", as: :add_skill
  get '/employees/skill/:skill', to: "employees#skills", as: :employeeSkills
end
