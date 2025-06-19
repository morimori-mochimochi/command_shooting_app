class AddDurationToScores < ActiveRecord::Migration[7.1]
  def change
    add_column :scores, :duration, :float
  end
end
