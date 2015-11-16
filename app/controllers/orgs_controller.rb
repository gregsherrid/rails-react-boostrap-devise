class OrgsController < ApplicationController
	before_action :authenticate_user!

	def show
		@org = Org.find(params[:id])
		render "orgs/show"
	end

	def new
		render "orgs/new"
	end

	def create
		@org = Org.new(strong_org_params)
		if @org.save
			@org.add_user(current_user, UserOrgLink::OWNER)
			render json: { success: true, org: @org }
		else
			render json: { success: false, errors: @org.errors.messages }
		end
	end
end