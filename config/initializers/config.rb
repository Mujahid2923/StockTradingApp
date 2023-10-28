# frozen_string_literal: true

require_relative '../../lib/file_parser'

# Reading from ENV within the application code can lead to runtime errors due to
# misconfiguration. To avoid that, we are loading it at boot time to application's configuration.
Rails.application.configure do
  config.role_permissions = FileParser.parse { 'config/permissions.yml' }
  config.available_permissions = FileParser.parse { 'config/available_permissions.yml' }
end
