class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books, id: false do |t|
      
      t.string :title
      t.string :author
      t.string :isbn, null: false, primary_key: true
      t.string :sales_date
      t.string :image
      t.string :rakuten_url

      t.timestamps
    end
  end
end
