require 'import_data'

desc "Import seed data into database"
task :import_seed_data  => [:environment] do

  path =  Rails.root.join('lib', 'assets', 'seed_data')
  Dir.glob("#{path}/recipes-*.json").each do |file|
    next unless File.file? file
    ImportData.from_file(file)
  end
end
