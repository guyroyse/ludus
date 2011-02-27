task :default => ["cuke"]

task :cuke do
  
  sh "jruby -S cucumber features" do |ok, result|
    puts "Cucumber failed. Status = #{result.exitstatus}" unless ok
  end
  
end