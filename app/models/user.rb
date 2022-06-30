class User < ApplicationRecord
  validates :name, :email, :chips, presence: true
end
