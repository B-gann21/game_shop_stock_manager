class VideoGamesController < ApplicationController
  def index
    @video_games = VideoGame.all
  end
end
