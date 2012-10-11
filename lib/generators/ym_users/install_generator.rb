module YmUsers
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path("../templates", __FILE__)
      desc "Install YmUsers"

      def manifest
        copy_file "controllers/users_controller.rb", "app/controllers/users_controller.rb"
        copy_file "models/ability.rb", "app/models/ability.rb"
        if File.exists?("db/seeds.rb")
          append_to_file "db/seeds.rb", File.read(find_in_source_paths("db/seeds.rb"))
        end
        if File.exists?("app/views/admin/index.html.haml")
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
      end

      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end
      
      private
      def try_migration_template(source, destination)
        begin
          migration_template source, destination
        rescue Rails::Generators::Error => e
          puts e
        end
      end
      
    end
  end
end
