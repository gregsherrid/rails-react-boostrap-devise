var FormErrorsMixin = {
	validate: function(data) {
		var errors = this.getValidationErrors(data);
		if (_.isEmpty(errors)) {
			return true;
		} else {
			this.setState({ errors: errors });
			return false;
		}
	},

	loadErrors: function(errors) {
		var errors = _.mapObject(errors, function(val, key) {
			if (key == "base") {
				return val;
			} else if (_.isArray(val)) {
				return val.map(function(text) {
					return key.capitalizeFirstLetter() + " " + text;
				}).join(", ");
			} else {
				return key.capitalizeFirstLetter() + " " + text;
			}
		});
		this.setState({ errors: errors });
	},

	buildSuccessFunction: function(successF) {
		return function(response) {
			if (response["success"]) {
				successF(response);
			} else {
				this.loadErrors(response["errors"]);
			}
		}.bind(this);
	},

	renderBaseErrors: function() {
		var errors = this.state.errors["base"];
				
		if (errors == undefined) {
			return undefined;
		} else if (_.isArray(errors) && errors.length > 1) {
			var errorTexts = errors.map(function(text) {
				return (
					<li key={ text }>
						{ text.capitalizeFirstLetter() }
					</li>
				)
			});

			return (
				<ul className="baseErrors">{ errorTexts }</ul>
			);
		} else if (_.isArray(errors)) {
			return (
				<div className="baseErrors">{ errors[0] }</div>
			)
		} else {
			return (
				<div className="baseErrors">{ errors }</div>
			)
		}
	},

	renderFieldErrors: function(field) {
		var error = this.state.errors[field];
		if (error) {
			return (
				<span className="fieldError">{ error }</span>
			)
		}
	}
};
