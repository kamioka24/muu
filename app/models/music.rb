class Music < ApplicationRecord
	validates :title, :artist, presence: true
end
