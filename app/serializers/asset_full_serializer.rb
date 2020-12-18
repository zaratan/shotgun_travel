class AssetFullSerializer < ActiveModel::Serializer
  attributes :description, :created_at, :title, :id

  has_many :shots, key: 'pictures' do
    object.shots.all
  end
end
