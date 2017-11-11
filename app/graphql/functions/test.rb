class Functions::Test < GraphQL::Function
  # Define `initialize` to store field-level options, eg
  #
  #     field :myField, function: Functions::test.new(type: MyType)
  #
   attr_reader :type
   def initialize(model_class:,type:)
     @model_class = model_class
     @type = type
   end

  # add arguments by type:
   argument :id, !types.ID

  # Resolve function:
  def call(obj, args, ctx)
  @model_class.find(args[:id])    
  end
end
