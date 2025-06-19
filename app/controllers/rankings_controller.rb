class RankingsController < ApplicationController
  def index
    @scores = Score.includes(:user).order(:duration).limit(30)
  end
end
