# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  author     :string(255)
#  name       :string(255)
#  title      :string(255)
#  isn        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
