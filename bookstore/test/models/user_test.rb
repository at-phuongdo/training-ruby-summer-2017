# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  user_name            :string(255)
#  email                :string(255)
#  password_digest      :string(255)
#  password_confirm     :string(255)
#  name                 :string(255)
#  gender               :integer
#  birthday             :datetime
#  role                 :integer          default(0)
#  image                :string(255)
#  provider             :string(255)
#  uid                  :string(255)
#  confirm_token        :string(255)
#  confirm_token_send   :datetime
#  confirm_token_at     :datetime
#  reset_password_token :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
