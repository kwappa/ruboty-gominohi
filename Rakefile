require 'bundler/gem_tasks'
require 'rake/testtask'

task default: :test

desc 'Run test_unit based test'
Rake::TestTask.new do |t|
  unless File.exists?('./.gominohi.yml')
    FileUtils.copy('./.gominohi.yml.sample', './.gominohi.yml')
  end

  t.libs << 'test'
  t.test_files = Dir['test/**/test_*.rb']
  t.verbose = true
end
