class RankingsController < ApplicationController
  def index
    @scores = GameSession.includes(:user).where.not(user_id: nil).order(:duration).limit(30)
  end
end
