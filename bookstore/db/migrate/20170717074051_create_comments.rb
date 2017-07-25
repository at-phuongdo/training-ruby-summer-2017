class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :image
      t.belongs_to :user
      t.belongs_to :book
      t.integer :rating
      t.timestamps
    end
  end
end
