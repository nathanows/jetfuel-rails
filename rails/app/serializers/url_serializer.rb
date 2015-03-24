class UrlSerializer < ActiveModel::Serializer
  attributes :id, :short, :long, :title, :short_url

  def short_url
    object.short_url
  end
end
