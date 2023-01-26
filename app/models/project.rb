class Project < ApplicationRecord
	validates_presence_of :name
	has_many :issues
	belongs_to :user
end
