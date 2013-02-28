class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :dummy_msg

  #this just to illustrate active_model_serializers feature
  #make sure to list in attributes call above
  def dummy_msg
    "JUST HERE FOR FUN W #{object.name}"
  end

end
