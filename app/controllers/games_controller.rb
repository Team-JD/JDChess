class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = current_user.game.create(game_params)
    if @game.valid?
        redirect_to root_path
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def index
    @game = Game.first
  end

  def game_params
    params.require(:game).permit(:email)
  end
end
