# frozen_string_literal: true

class Asset
  include ActiveShotgun::Model

  belongs_to :project
  validates :project_id, presence: true

  has_many :shots

  alias_method :title, :code
  alias_method :title=, :code=
end
