# frozen_string_literal: true

class Shot
  include ActiveShotgun::Model

  has_many :assets

  belongs_to :project
  validates :project_id, presence: true

  alias_method :url, :sg_image_url
  alias_method :url=, :sg_image_url=

  alias_method :title, :code
  alias_method :title=, :code=
end
