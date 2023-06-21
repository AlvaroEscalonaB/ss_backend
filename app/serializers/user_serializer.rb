class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :token

  def token
    instance_options[:token]
  end

end
