class GameSessionsController < ApplicationController
  before_action :set_game_session, only: [:show, :finish, :finished, :result]
  def create
    @game_session = 
    if user_signed_in?
      current_user.game_sessions.create!
    else
      GameSession.create!
    end

    # Commandからランダムに５つ選び、Gamesessionに結びつける
    # pluck: commandsテーブルの全てのレコードから:idカラムの値だけを取り出して配列として返す
    # command_ids = Command.pluck(:id).sample(5) <-これは非効率的なので書き換える

    # DBでランダムに５件取得することで全IDをメモリにロードするのを防ぐ
    command_ids = Command.order("RANDOM()").limit(5).pluck(:id)
    @game_session.update!(command_ids: command_ids)

    redirect_to game_session_path(@game_session)
  end

  def show
    @commands = @game_session.commands
    @current_index = (params[:index] || 0).to_i
    @command = @commands[@current_index]
  end

  def finish
    puts "[DEBUG] PARAMS: #{params.inspect}"
    @game_session.update(duration: params[:duration])
  end

  def finished; end

  def result; end

  private

  def set_game_session
    @game_session = GameSession.find(params[:id])
  end
end
