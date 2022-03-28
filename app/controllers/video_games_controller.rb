class VideoGamesController < ApplicationController
  def index
    @video_games = VideoGame.multiplayer_only
  end

  def show
    @video_game = VideoGame.find(params[:id])
  end

  def edit
    @video_game = VideoGame.find(params[:id])
  end

  def update
    video_game = VideoGame.find(params[:id])
    video_game.update(video_game_params)
    redirect_to "/video_games/#{video_game.id}"
  end

private
  def video_game_params
    params.permit :name, :rating, :price, :multiplayer
  end
end
