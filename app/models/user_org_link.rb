# == Schema Information
#
# Table name: user_org_links
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  org_id     :integer
#  role       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class UserOrgLink < ActiveRecord::Base
	belongs_to :user
	belongs_to :org

	validates :user_id, presence: true
	validates :org_id, presence: true
	validates :role, presence: true

	ADMIN = "admin"
	OWNER = "owner"
end
