Pollster::Application.routes.draw do
  root :to => "polls#index"

  resources :polls do
    resources :questions
  end
end
