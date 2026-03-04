module GameSessionsHelper
  # 次の問題、もしくは終了画面へのURLを返すヘルパーメソッド
  def next_question_url(game_session, commands, current_index)
    if commands.size > current_index + 1
      # 次の問題がある場合
      game_session_path(game_session, index: current_index + 1)
    else
      # これが最後の問題だった場合
      finished_game_session_path(game_session)
    end
  end
end
