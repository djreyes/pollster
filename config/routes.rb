Pollster::Application.routes.draw do
  get "responses/index"

  get "responses/show"

  get "responses/new"

  get "responses/create"

  get "responses/edit"

  get "responses/update"

  get "responses/destroy"

  root :to => "polls#index"

  resources :polls do
    resources :questions
  end
end
