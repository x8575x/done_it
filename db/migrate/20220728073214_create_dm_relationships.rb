class CreateDmRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :dm_relationships do |t|
      t.integer :user_id
      t.integer :dm_room_id

      t.timestamps
    end
  end
end
