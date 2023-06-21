class UserFavoritesSerializer < ActiveModel::Serializer
  attributes :id, :fact, :cat_fact_id

  def fact
    self.object.cat_fact.fact
  end

  def cat_fact_id
    self.object.cat_fact.id
  end

end
