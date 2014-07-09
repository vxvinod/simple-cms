class Page < ActiveRecord::Base
	belongs_to :subject
	has_many :sections
	has_and_belongs_to_many :editors, :join_table => "admin_users_pages", :class_name => "AdminUser"
end
