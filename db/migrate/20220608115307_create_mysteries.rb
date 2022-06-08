class CreateMysteries < ActiveRecord::Migration[6.1]
  def change
    create_table :mysteries do |t|
      
      t.string :name

      t.timestamps
    end
  end
end
