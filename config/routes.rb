Pollster::Application.routes.draw do
  get "questions/index"

  get "questions/show"

  get "questions/new"

  get "questions/create"

  get "questions/edit"

  get "questions/update"

  get "questions/destroy"

  root :to => "polls#index"
  resources :polls
end
