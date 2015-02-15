Rake::Task['default'].clear

task default: [:rubocop, :spec]
