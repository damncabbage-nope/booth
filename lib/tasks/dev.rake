# The dev rake task does everything needed to setup an application to work in development
# mode for a new developer.
#
# Running `rake dev:setup` should be all you need to get a new application running.
#
# (Inspired by reInteractive's default_readme dev.rake; config_files instead copies
#  all *.example.yml, instead of those listed in an array.)

namespace :dev do

  desc "Basic development setup process"
  task :setup do
    if Rails.env.production?
      raise StandardError, "You probably didn't mean to setup the production database"
    end
    Rake::Task["dev:config_files"].invoke
    Rake::Task["dev:nuke"].invoke
  end

  desc "Nukes the database completely and rebuilds it using any seed file that is present."
  task :nuke do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    if File.exist?(Rails.root.join('config/schema.rb'))
      Rake::Task["db:schema:load"].invoke
    end
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
    Rake::Task["db:test:clone"].invoke
  end

  desc "Creates the needed config files for the system to start."
  task :config_files do
    examples = Dir[File.join(Rails.root, 'config/*.example.yml')]
    examples.each do |example|
      target = example.sub(/\.example\.yml\Z/, '.yml')
      if File.exist? target
        puts "File already exists: #{File.basename(target)}"
      else
        puts `cp -v "#{example}" "#{target}"`
      end
    end
  end

end
