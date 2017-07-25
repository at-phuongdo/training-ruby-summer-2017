# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  author     :string(255)
#  name       :string(255)
#  title      :string(255)
#  isn        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ApplicationRecord
  has_many :comments
  has_many :orders
  has_many :carts, through: :orders
  has_many :users, through: :comments
  scope :search_author, lambda { |name_author|
    joins(:orders).where('books.author like :name_author', name_author: name_author).distinct
  }
end
