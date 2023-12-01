class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, format: { with: /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*(\+[a-z0-9-]+)?@[a-z0-9-]+(\.[a-z0-9-]+)*\Z/i, message: 'must be a valid email address' }
end
