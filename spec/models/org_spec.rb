# == Schema Information
#
# Table name: orgs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

describe Org do
	let!(:org) { FactoryGirl.create(:org) }

	subject { org }

	it "| Responds to" do
		should respond_to :name
		should respond_to :id
	end

	it { should be_valid }

	it "| Attribute presence" do
		should validate_presence_of(:name)
	end

	describe "| Users" do
		it "| Adding, checking, and removing users" do
			user = FactoryGirl.create(:user)

			expect do
				org.add_user(user, UserOrgLink::OWNER)
			end.to change { UserOrgLink.count }.by(1)

			org.reload.has_user?(user).should == true

			expect do
				org.remove_user(user)
			end.to change { UserOrgLink.count }.by(-1)

			org.reload.has_user?(user).should == false
		end
	end
end
