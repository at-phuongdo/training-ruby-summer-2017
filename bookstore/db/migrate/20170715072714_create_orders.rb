class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      # t.integer :cart_id
      # t.integer :book_id
      t.integer :quantity
      t.belongs_to :cart
      t.belongs_to :book
      t.timestamps
    end
  end
end
