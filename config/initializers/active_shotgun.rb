# frozen_string_literal: true

ActiveShotgun::Config.configure do |c|
  c.shotgun_site_name = ENV['SHOTGUN_SITE_NAME']
  c.shotgun_client_id = ENV['SHOTGUN_SCRIPT_NAME']
  c.shotgun_client_secret = ENV['SHOTGUN_SCRIPT_KEY']
end
