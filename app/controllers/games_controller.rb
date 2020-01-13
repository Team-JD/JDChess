class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.create();
    @game.player1 = current_user.email;
  end

  def show
    @game = Game.find(params[:id])
    @pieces = @game.pieces
  end

  def index
  end
  private

  def game_params
    params.require(:game).permit(:player1, :player2, :status, :winner, :loser, :current_turn, :player1Color, :player2Color, :started, :ended)
  end
end
