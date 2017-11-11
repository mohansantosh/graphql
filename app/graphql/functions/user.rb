class UserFunc < GraphQL::Function
  # Define a member of `#arguments`, just like the DSL:
  argument :id, types.ID

  # Define documentation:
  description "My Custom function"
  deprecation_reason "Just an example"

  type UserType
  # or, define one on the fly:
  type do
    name "UserType"
    # The returned object must implement these methods:
    field :name, types.String
    field :count, types.Int
  end
end
