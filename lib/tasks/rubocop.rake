require 'rubocop/rake_task'

desc 'Run RuboCop with cop names.'
RuboCop::RakeTask.new(:rubocop) do |task|
  task.options = ['--display-cop-names']
end
