class ShotSerializer < ActiveModel::Serializer
  attributes :description, :title, :url, :created_at, :id
end
