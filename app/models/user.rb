class User < ApplicationRecord
    has_many :chore_lists
    has_many :tasks
    has_secure_password #authenticate, validate password &/or password confirmation
end