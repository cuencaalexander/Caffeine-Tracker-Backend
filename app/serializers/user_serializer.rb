class UserSerializer
    include FastJsonapi::ObjectSerializer
    attributes :quantity
    belongs_to :drink
end