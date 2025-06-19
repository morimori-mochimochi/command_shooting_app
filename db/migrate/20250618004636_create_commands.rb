class CreateCommands < ActiveRecord::Migration[7.1]
  def change
    create_table :commands do |t|
      t.string :body
      t.string :description

      t.timestamps
    end
  end
end
