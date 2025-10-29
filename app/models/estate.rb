class Estate < ApplicationRecord
	enum :role_id, { "惡魔貓": 1, "老P": 2 }

	validates :role_id, presence: true
	validates :role_id, exclusion: { in: %w(1 2),
    message: "%{value} is not a valid role" }
	validates :value, presence: true


end
