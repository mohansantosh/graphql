Types::UserType = GraphQL::ObjectType.define do
  name "User"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  #field :id, types.ID
  #field :id, types.Int
  field :city do
   type types.String
   resolve -> (obj,args,cxt){
      obj.city + " Awesome" 
  }
  end
  field :address, types.String
end
