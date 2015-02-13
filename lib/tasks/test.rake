# Remove unused rake tasks
# http://stackoverflow.com/questions/13733141/disable-rake-task
Rake::Task['test'].clear
Rake::Task['test:all'].clear
Rake::Task['test:db'].clear
Rake::Task['test:all:db'].clear
