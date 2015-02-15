require 'rubocop/rake_task'

desc 'Generate a fix list file when running Rubocop.'
RuboCop::RakeTask.new(:rubocop) do |task|
  # Send output to file then add a second format to put default (progress) output to stdout.
  # This is different from --auto-gen-config, which generates a config to bypass offenses.
  task.options = ['--display-cop-names', '--out', 'FIX_THESE.txt', '--format', 'progress']
end
