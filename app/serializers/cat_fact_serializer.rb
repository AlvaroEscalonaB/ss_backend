class CatFactSerializer < ActiveModel::Serializer
  attributes :id, :fact, :is_favorite

  def is_favorite
    instance_options[:is_favorite]
  end

end
