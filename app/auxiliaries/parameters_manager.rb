module ParametersManager
	def strong_org_params
		params.require(:org).permit(:name)
	end

end