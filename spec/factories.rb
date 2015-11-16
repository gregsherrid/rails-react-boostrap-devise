FactoryGirl.define do
	factory :org do
		sequence(:name) { |n| "Org#{n}" }
	end

	factory :user do
		sequence(:first_name) { |n| "First#{n}" }
		sequence(:last_name) { |n| "Last#{n}" }
		sequence(:email) { |n| "user#{n}@example.com" }

		password "foobar1"
		password_confirmation "foobar1"		
	end
end