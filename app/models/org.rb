# == Schema Information
#
# Table name: orgs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Org < ActiveRecord::Base
	has_many :user_org_links
	has_many :users, through: :user_org_links

	def add_user(user, role)
		user_org_links.create(user_id: user.id, role: role)
	end

	def has_user?(user)
		user_org_links.where(user_id: user.id).any?
	end

	def remove_user(user)
		link = user_org_links.find_by(user_id: user.id)
		raise "Org does not have user" if link.nil?
		link.destroy
	end

	validates :name, presence: true
end
