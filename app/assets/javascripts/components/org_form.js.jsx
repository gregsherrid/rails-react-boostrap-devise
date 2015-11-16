var OrgForm = React.createClass({
	mixins: [FormErrorsMixin],
	
	getInitialState: function() {
		return { loading: false, errors: {} };
	},

	getValidationErrors: function(data) {
		var errors = {};
		if (data["name"] == null || data["name"].trim().length < 1) {
			errors["name"] = "Please enter a name";
		}
		return errors;
	},

	onSubmit: function(e) {
		e.preventDefault();
		var name = ReactDOM.findDOMNode(this.refs.name).value.trim();
		var data = { name: name };

		if (this.validate(data)) {
			this.setState({ loading: true });
			postJSON(Routes.orgs_path(), { org: data }, this.buildSuccessFunction(function(response) {
				window.location.href = Routes.org_path(response["org"].id)
			}));
		} else {

		}
	},

	render: function() {
		return (
			<form onSubmit={ this.onSubmit } className="orgForm" >
				{ this.renderBaseErrors('name') }
				<div className="field">
					<label htmlFor="name">Name { this.renderFieldErrors('name') }</label>
					<input id="name" ref="name" className="form-control name" autofocus={ true } />
				</div>

				<LaddaButton loading={ this.state.loading } className={ "btn btn-primary" } buttonStyle={ "slide-down" } >
					Click here
				</LaddaButton>
			</form>
		);
	}
});
