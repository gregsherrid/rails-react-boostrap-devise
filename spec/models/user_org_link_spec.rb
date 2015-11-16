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

require 'rails_helper'

describe UserOrgLink do
	let!(:user) { FactoryGirl.create(:user) }
	let!(:org) { FactoryGirl.create(:org) }
	let!(:user_org_link) { org.add_user(user, UserOrgLink::ADMIN) }

	subject { user_org_link }

	it "| Responds to" do
		should respond_to :org
		should respond_to :user
		should respond_to :role
		should respond_to :id
	end

	it { should be_valid }

	it "| Attribute presence" do
		should validate_presence_of(:user_id)
		should validate_presence_of(:org_id)
		should validate_presence_of(:role)
	end

	it "| Associations" do
		user_org_link.user.should == user
		user_org_link.org.should == org

		org.user_org_links.should == [user_org_link]
		org.users.should == [user]

		user.user_org_links.should == [user_org_link]
		user.orgs.should == [org]
	end
end
