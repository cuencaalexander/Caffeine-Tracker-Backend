class DrinkSerializer
    include FastJsonapi::ObjectSerializer
    attributes :name, :description
end