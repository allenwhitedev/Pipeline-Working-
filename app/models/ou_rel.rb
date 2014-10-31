class OuRel < ActiveRecord::Base
	belongs_to :joiner, class_name: "User"
	belongs_to :joined, class_name: "Organization"
	validates :joiner_id, presence: true
	validates :joined_id, presence: true
end
