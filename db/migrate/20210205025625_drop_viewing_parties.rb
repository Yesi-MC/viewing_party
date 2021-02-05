class DropViewingParties < ActiveRecord::Migration[5.2]
  def change
    drop_table :viewing_parties
  end
end
