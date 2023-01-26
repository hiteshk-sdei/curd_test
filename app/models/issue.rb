class Issue < ApplicationRecord
	belongs_to :project
	belongs_to :user
	has_many :comments, dependent: :destroy
  	accepts_nested_attributes_for :comments, allow_destroy: true, reject_if: :all_blank
  	validates_presence_of :title
  	validates_presence_of :assigned_to

	enum status: { active: 0, on_hold: 1, resolved: 2, closed: 3 }
end
