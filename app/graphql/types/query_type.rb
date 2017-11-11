Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

  field :user, types.String do
    description "An example field added by the generator"
    type Types::UserType
    resolve ->(obj, args, ctx) {
      User.first
    }
  end

  field :user_by_func,function: Functions::Test.new(model_class: User, type: Types::UserType)

  field :user_by_id  do
    description "An example field added by the generator"
    type Types::UserType
    argument :id, types.ID
    resolve ->(obj, args, ctx) {
      User.find(args["id"])
    }
  end
end
