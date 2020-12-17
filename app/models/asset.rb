# frozen_string_literal: true

class Asset
  include ActiveShotgun::Model

  belongs_to :project
  validate :project_id, presence: true

  has_many :shots
end
