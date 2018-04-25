class Attendee < ActiveRecord::Base
	validates_inclusion_of :likes_beer, in: [true, false]
	belongs_to :happyhour
end