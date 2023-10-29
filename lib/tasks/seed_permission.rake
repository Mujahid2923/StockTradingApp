# frozen_string_literal: true

require_relative '../../permissions/bulk_updater'

namespace :seed do
  desc 'seed the permission w.r.t to permission.yml file'

  task permissions: :environment do
    Role.names.each_key do |name|
      role = Role.find_or_create_by!(name: name)
      Permissions::BulkUpdater.new(role: role).call
    rescue NoMethodError
      puts "No policy configuration for #{role.name}"
    end
  end
end
