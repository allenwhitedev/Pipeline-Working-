class Organization < ActiveRecord::Base
	belongs_to :user_id
  has_many :reverse_ou_rels, foreign_key: "joined_id",
                                   class_name:  "OuRel",
                                   dependent:   :destroy
  has_many :joiners, through: :reverse_ou_rels, source: :joiner
  has_many :reverse_oe_rels, foreign_key: "attended_id",
                                   class_name:  "OeRel",
                                   dependent:   :destroy
  has_many :attenders, through: :reverse_oe_rels, source: :attender
	default_scope -> { order('created_at DESC') } 
	#validates :user_id, presence: true
	validates :name, length: { in: 2..50 }
	validates :description, length: { maximum: 10000 }
end
