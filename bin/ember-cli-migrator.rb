#!/usr/bin/env ruby

require 'optparse'
require 'fileutils'

options = {}
OptionParser.new do |opts|
  opts.on("-s", "--source SOURCE", "Input dir") do |v|
    options[:source] = v
  end

  opts.on("-t", "--target TARGET", "Output dir") do |v|
    options[:target] = v
  end
end.parse!

app_name = 'Samolov'

p options[:source]
p options[:target]

# views
views = File.join options[:source], "/views/**", "*.coffee"


Dir.glob(views) do |f|
  p f
  target_file_name = f.gsub(options[:source], options[:target]).gsub! '.js', ''
  p target_file_name
  file_content = File.read(f)

  dirname = File.dirname(target_file_name)
  unless File.directory?(dirname)
    FileUtils.mkdir_p(dirname)
  end

  unless file_content.scan(/#{app_name}\.(.+?) = /)[0].nil?
    route_name = file_content.scan(/#{app_name}\.(.+?) = /)[0][0]
    new_contents = file_content.gsub "#{app_name}.", ''
    new_contents = "`import Ember from \"ember\";` \n \n" + new_contents + "\n \n`export default #{route_name};`"
    File.open(target_file_name, "w") do |file|
      file.puts new_contents
    end
  end
end




models = File.join options[:source], "/models/**", "*.coffee"

# Models
Dir.glob(models) do |f|
  target_file_name = f.gsub(options[:source], options[:target]).gsub! '.js', ''
  file_content = File.read(f)

  dirname = File.dirname(target_file_name)
  unless File.directory?(dirname)
    FileUtils.mkdir_p(dirname)
  end

  model_name = file_content.scan(/#{app_name}\.(.+?) = /)[0][0]
  new_contents = file_content.gsub "#{app_name}.", ''
  new_contents = "`import DS from \"ember-data\";` \n \n" + new_contents + "\n \n`export default #{model_name};`"
  File.open(target_file_name, "w") do |file|
    file.puts new_contents
  end
end

# Routes
routes = File.join options[:source], "/routes/**", "*.coffee"
Dir.glob(routes) do |f|
  target_file_name = f.gsub(options[:source], options[:target]).gsub! '_route.js', ''
  file_content = File.read(f)

  dirname = File.dirname(target_file_name)
  unless File.directory?(dirname)
    FileUtils.mkdir_p(dirname)
  end

  route_name = file_content.scan(/#{app_name}\.(.+?) = /)[0][0]
  new_contents = file_content.gsub "#{app_name}.", ''
  new_contents = "`import Ember from \"ember\";` \n \n" + new_contents + "\n \n`export default #{route_name};`"
  File.open(target_file_name, "w") do |file|
    file.puts new_contents
  end
end


# Controllers
controllers = File.join options[:source], "/controllers/**", "*.coffee"
Dir.glob(controllers) do |f|
  target_file_name = f.gsub(options[:source], options[:target]).gsub! '_controller.js', ''
  file_content = File.read(f)

  dirname = File.dirname(target_file_name)
  unless File.directory?(dirname)
    FileUtils.mkdir_p(dirname)
  end

  route_name = file_content.scan(/#{app_name}\.(.+?) = /)[0][0]
  new_contents = file_content.gsub "#{app_name}.", ''
  new_contents = "`import Ember from \"ember\";` \n \n  #{new_contents}\n \n `export default #{route_name};`"
  File.open(target_file_name, "w") do |file|
    file.puts new_contents
  end
end



# components
components = File.join options[:source], "/components/**", "*.coffee"
Dir.glob(components) do |f|
  target_file_name = f.gsub(options[:source], options[:target]).gsub! '_component.js', ''
  file_content = File.read(f)

  unless target_file_name.nil?
    dirname = File.dirname(target_file_name)
    unless File.directory?(dirname)
      FileUtils.mkdir_p(dirname)
    end

    route_name = file_content.scan(/#{app_name}\.(.+?) = /)[0][0]
    new_contents = file_content.gsub "#{app_name}.", ''
    new_contents =  "`import Ember from \"ember\";` \n \n #{new_contents} \n \n`export default #{route_name};`"
    File.open(target_file_name, "w") do |file|
      file.puts new_contents
    end
  end

end


# serializers
serializers = File.join options[:source], "/serializers/**", "*.coffee"
Dir.glob(serializers) do |f|
  target_file_name = f.gsub(options[:source], options[:target]).gsub! '_serializer.js', ''
  file_content = File.read(f)

  dirname = File.dirname(target_file_name)
  unless File.directory?(dirname)
    FileUtils.mkdir_p(dirname)
  end

  model_name = file_content.scan(/#{app_name}\.(.+?) = /)[0][0]
  new_contents = file_content.gsub "#{app_name}.", ''
  new_contents = "`import DS from \"ember-data\";` \n \n" + new_contents + "\n \n`export default #{model_name};`"
  File.open(target_file_name, "w") do |file|
    file.puts new_contents
  end
end

# mixins
mixins = File.join options[:source], "/mixins/**", "*.coffee"
Dir.glob(mixins) do |f|
  target_file_name = f.gsub(options[:source], options[:target]).gsub! '.js', ''
  file_content = File.read(f)

  dirname = File.dirname(target_file_name)
  unless File.directory?(dirname)
    FileUtils.mkdir_p(dirname)
  end

  model_name = file_content.scan(/#{app_name}\.(.+?) = /)[0][0]
  new_contents = file_content.gsub "#{app_name}.", ''
  new_contents = "`import Ember from \"ember\";` \n \n" + new_contents + "\n \n`export default #{model_name};`"
  File.open(target_file_name, "w") do |file|
    file.puts new_contents
  end
end