class User < ApplicationRecord
	has_many :projects
	has_many :issues
	has_many :comments
end
