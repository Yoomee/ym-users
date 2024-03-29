module YmUsers
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include YmCore::Generators::Migration

      source_root File.expand_path("../templates", __FILE__)
      desc "Install YmUsers"

      def manifest
        copy_file "controllers/users_controller.rb", "app/controllers/users_controller.rb"
        copy_file "models/user.rb", "app/models/user.rb"
        copy_file "models/ability.rb", "app/models/ability.rb"
        if File.exists?("db/seeds.rb") && !file_contains?("#{Rails.root}/db/seeds.rb", '@yoomee.com')
          append_to_file "db/seeds.rb", File.read(find_in_source_paths("db/seeds.rb"))
        end
        if File.exists?("app/views/admin/index.html.haml") && !file_contains?("#{Rails.root}/app/views/admin/index.html.haml", 'Users')
          append_to_file "app/views/admin/index.html.haml", File.read(find_in_source_paths("views/admin/index.html.haml"))
        end
        if Dir.glob("public/dragonfly/defaults/user.*").empty?
          copy_file "images/user.jpg", "public/dragonfly/defaults/user.jpg"
        end
        # Migrations must go last
        Dir[File.dirname(__FILE__) + '/templates/migrations/*.rb'].each do |file_path|
          file_name = file_path.split("/").last
          try_migration_template "migrations/#{file_name}", "db/migrate/#{file_name.sub(/^\d+\_/, '')}"
        end
        unless file_contains?("#{Rails.root}/config/routes.rb", 'ym_users_routes')
          route 'ym_users_routes'
        end
      end

      private
      def file_contains?(file_name, text)
        File.open(file_name).read.include?(text)
      end

    end
  end
end
