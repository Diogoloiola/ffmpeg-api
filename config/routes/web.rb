namespace :web, defaults: { format: :json } do
  namespace :v1 do
    resources :audios, only: %i[create]
  end
end
