# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  first_name             :string(255)
#  last_name              :string(255)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

describe User do
	let!(:user) { FactoryGirl.create(:user) }

	subject { user }

	it "| Responds to" do
		should respond_to :first_name
		should respond_to :last_name
		should respond_to :email
		should respond_to :id
	end

	it { should be_valid }

	it "| Attribute presence" do
		should validate_presence_of(:first_name)
		should validate_presence_of(:last_name)
		should validate_presence_of(:email)
	end
end
