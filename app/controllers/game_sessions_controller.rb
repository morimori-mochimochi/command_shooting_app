class GameSessionsController < ApplicationController
  before_action :set_game_session, only: [:show, :finish, :finished, :result]
  def create
    # GameSessionCreatorサービスを使ってゲームセッションの作成ロジックを呼び出す
    @game_session = GameSessionCreator.new(user: current_user).call

    redirect_to game_session_path(@game_session)
  end

  def show
    @commands = @game_session.commands
    @current_index = (params[:index] || 0).to_i
    @command = @commands[@current_index]
  end

  def finish
    @game_session.update(duration: params[:duration])
  end

  def finished; end

  def result; end

  private

  def set_game_session
    @game_session = GameSession.find(params[:id])
  end
end
