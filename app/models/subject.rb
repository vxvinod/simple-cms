class Subject < ActiveRecord::Base

	has_many :pages
	scope :visible, lambda { where(:visible => true) }
	scope :sorted, lambda { order("subjects.position ASC") }
	scope :descend, lambda { order("subjects.position DESC")}
	scope :invisible, lambda { where(:visible => false) }
	scope :newest_first, lambda { order("subjects.created_at DESC")}
	scope :search, lambda { |query|
		where(["name LIKE ?", "#{query}"])
	}
end
