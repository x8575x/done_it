class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books, id: false do |t|
      
      t.string :title
      t.string :author
      t.string :isbn
      t.date :sales_date
      t.string :image
      t.string :rakuten_url

      t.timestamps
    end
  end
end
