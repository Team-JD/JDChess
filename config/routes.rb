Rails.application.routes.draw do
  devise_for :users
  root 'chess_board#index'
  root 'games#index'
end
