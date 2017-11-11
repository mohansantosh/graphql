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

  field :user_by_id do
    type types[Types::UserType]
    description "An example field added by the generator"
    argument :city, !types.String
    resolve ->(obj, args, ctx) {
      User.where("city = ?",args["city"])
    }
  end


  field :create_user do
    type Types::UserType
    description "Add a new user details"
    argument :id, !types.Int
    argument :first_name, !types.String
    argument :last_name, !types.String
    argument :address, !types.String
    argument :city, !types.String
    resolve -> (obj,args,ctx){
	user = User.create(id: args["id"],first_name: args["first_name"],last_name: args["last_name"],address: args["address"],city: args[:city])
	user
    }
  end
end
