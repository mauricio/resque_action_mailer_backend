require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "resque_action_mailer_backend"
    gem.summary = %Q{Use Resque to enqueue and send your emails}
    gem.description = %Q{
      With this gem you will be able to enqueue your emails
      on your Resque workers to avoid making your user wait for the email to be
      send when he causes an email sending action in your application.

      Using resque_action_mailer_backend makes email sending a breeze as
      you will be able to use Resque to retry failed emails, easily deliver all
      those marketing emails to your clients and without changing anything at
      your email sending code.

      Just tell your application to use :resque for sending emails and you're done,
      no need to add yet another tool just for delivering your emails if you're
      already using Resque for your asynchronous processing.
    }
    gem.email = "mauricio.linhares@gmail.com"
    gem.homepage = "http://github.com/mauricio/resque_action_mailer_backend"
    gem.authors = ["Maurício Linhares"]

    gem.add_dependency "resque", ">= 1.8.0"
    gem.add_dependency 'actionmailer', '>= 2.2.0'
    gem.add_development_dependency "rspec", ">= 1.2.9"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError => ex
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
  puts ex
  puts ex.backtrace.join("\n")
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "resque_action_mailer_backend #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
