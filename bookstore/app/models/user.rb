# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  user_name          :string(255)
#  email              :string(255)
#  password_digest    :string(255)
#  name               :string(255)
#  gender             :integer
#  birthday           :datetime
#  role               :integer          default(0)
#  avatar             :string(255)
#  provider           :string(255)
#  uid                :string(255)
#  confirm_token      :string(255)
#  confirm_token_send :datetime
#  confirm_token_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  # has_secure_password

  has_secure_password
  enum gender: %w[male female other]
  validates :user_name, :email, uniqueness: true
  validates :user_name, :password, presence: true
  validates :email, presence: true, if: proc { provider == 'email' }
  validates :name, length: { in: 6..30 }, allow_blank: true
  validate :birthday_format
  validate :avatar_size
  validates :uid, uniqueness: { scope: :provider }, allow_blank: true

  has_many :my_carts, class_name: 'Cart'
  has_many :carts # tra ve mang, has_one :cart #tra ve doi tuong
  has_many :orders, through: :carts
  has_many :books, through: :orders
  has_many :comments

  # validate :presence_email
  # validate :uniqueness_provider_and_uid

  # def presence_email
  #   self.errors.add(:email, 'Email cannot blank') if (provider == "email" and email==nil)
  # end

  # def uniqueness_provider_and_uid
  #   user = User.find_by provider: self.provider
  #   if(user!=nil)
  #     self.errors.add(:uid, 'UID da ton tai') if (user.uid == self.uid)
  #   end
  # end

  def avatar_size
    error.add(:image, 'Avatar should be less than 5 megabytes') if !image.nil? && image.size > 5.megabytes
  end

  def birthday_format
    errors.add(:birthday, 'You should be over 16 years old.') if birthday.present? && Time.now - 16.years < birthday
  end
end
