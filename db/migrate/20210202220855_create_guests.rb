class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.references :watch_party, foreign_key: true
      t.references :invitee

      t.timestamps
    end
  end
end
