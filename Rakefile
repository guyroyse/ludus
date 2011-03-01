task :default => ["spec", "cuke"]

task :spec do
  sh "jruby -S rspec --color --format d spec/ruby/*"
end

task :cuke do
  
  sh "jruby -S cucumber features" do |ok, result|
    puts "Cucumber failed. Status = #{result.exitstatus}" unless ok
  end
  
end