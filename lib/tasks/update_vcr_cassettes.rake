desc 'Run live web requests and record the responses overtop of existing VCR cassettes'
task :update_vcr_cassettes do
  require 'dotenv'
  Dotenv.load

  path = File.join(Rails.root, 'spec', 'vcr')
  Dir.foreach(path) do |file|
    next unless File.extname(file) == '.yml'

    file = File.join(path, file)
    puts "Deleting #{file}..."
    File.delete(file)
  end

  Rake::Task['spec'].invoke
end
