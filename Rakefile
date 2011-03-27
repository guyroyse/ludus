task :default => [:spec]

desc "Runs specs against ruby code"
task :spec => [:build] do
  sh "jruby -J-classpath war/WEB-INF/classes:war/WEB-INF/lib/appengine-api-1.0-sdk-1.4.0.jar -S rspec --tty --color --format d spec/ruby/*"
end

desc "Runs cukes against running application, start in another terminal with rake run"
task :cuke do  
  sh "jruby -S cucumber features" do |ok, result|
    puts "Cucumber failed. Status = #{result.exitstatus}" unless ok
  end  
end

desc "Does a clean and compile"
task :build do
  sh 'ant build'
end

desc "Does a clean-all and compile"
task :buildall do
  sh 'ant build-all'
end
  
desc "Removes compiled code"
task :clean do
  sh 'ant clean'
end

desc "Removes compiled code and dependencies"
task :cleanall do
  sh 'ant clean-all'
end

desc "Install or reinstall dependencies"
task :install do
  sh 'ant install'
end
  
desc 'Builds the target"'
task :compile do
  sh 'ant compile'
end

desc "Runs the application"  
task :run do
  sh 'ant run'
end

desc "Deploy application to Google"
task :deploy do
  sh "appcfg.sh update war"
end