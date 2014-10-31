class OeRel < ActiveRecord::Base
	belongs_to :attender, class_name: "Event"
	belongs_to :attended, class_name: "Organization"
	validates :attender_id, presence: true
	validates :attended_id, presence: true
end
