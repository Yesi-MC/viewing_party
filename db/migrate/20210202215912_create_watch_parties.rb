class CreateWatchParties < ActiveRecord::Migration[5.2]
  def change
    create_table :watch_parties do |t|
      t.string :movie_title
      t.string :date
      t.string :time
      t.integer :duration
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
