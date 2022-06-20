class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books, id: false do |t|

      t.string :title
      t.string :author
      t.bigint :isbn, null: false, primary_key: true
      t.string :sales_date
      t.string :publisher_name
      t.text :item_caption
      t.string :item_price
      t.string :image
      t.string :image_m
      t.string :rakuten_url

      t.timestamps
    end
  end
end
