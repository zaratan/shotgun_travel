class AssetSerializer < ActiveModel::Serializer
  attributes :description, :created_at, :title, :id

  has_many :shots, key: 'pictures' do
    object.shots.first(3)
  end
end
