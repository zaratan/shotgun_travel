# frozen_string_literal: true

class Shot
  include ActiveShotgun::Model

  has_many :assets

  belongs_to :project
  validate :project_id, presence: true
end
