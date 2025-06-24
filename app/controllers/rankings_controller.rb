class RankingsController < ApplicationController
  def index
    @scores = GameSession.includes(:user).order(:duration).limit(30)
  end
end
