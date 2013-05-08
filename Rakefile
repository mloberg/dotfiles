require "rake"
require "erb"

task :default => :install

desc "install dotfiles into user's home directory"
task :install do
  replace_all = false
  Dir["**/*.{symlink,erb}"].each do |symlink|
    dotfile = File.basename(symlink).gsub(/\.(symlink|erb)$/, '')
    target = File.join(ENV['HOME'], ".#{dotfile}")
    if File.exists? target
      if File.identical? symlink, target
        puts "identical ~/.#{dotfile}"
      elsif replace_all
        replace_file(symlink)
      else
        print "Overwrite ~/.#{dotfile}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(symlink)
        when 'y'
          replace_file(symlink)
        when 'q'
          exit
        else
          puts "skipping ~/.#{dotfile}"
        end
      end
    else
      link_file(symlink)
    end
  end
  install_vundle
  puts "Run `rake bashfu to install Bashfu`"
end

desc "Install and enable Bashfu"
task :bashfu do
  BASHFU = File.join(ENV['HOME'], ".bashfu")
  %w(aliases plugins completion).each do |type|
    system %Q{mkdir -p #{BASHFU}/#{type}/enabled}
    print "Would to to enable all, some, or no #{type}? [all/some/none] "
    case STDIN.gets.chomp
    when 'all'
      Dir["#{BASHFU}/#{type}/available/*.bash"].each do |file|
        filename = File.basename(file)
        target = "#{BASHFU}/#{type}/enabled/#{filename}"
        if not File.identical?(file, target)
          system %Q{rm -rf "#{target}"} if File.exists?(target)
          system %Q{ln -s "#{file}" "#{target}"}
        end
      end
    when 'some'
      type_single = type.gsub(/e?s$/, '')
      Dir["#{BASHFU}/#{type}/available/*.bash"].each do |path|
        filename = File.basename(path)
        name = filename.gsub(".#{type}.bash", "")
        print "Would you like to enable the #{name} #{type_single} [y/n] "
        case STDIN.gets.chomp.downcase
        when 'y'
        when 'yes'
          system %Q{ln -s "#{path}" "#{BASHFU}/#{type}/enabled/#{filename}"}
        else
          # Move along
        end
      end
    else
      # Move along
    end
  end
end

def install_vundle
  target = ENV['HOME'] + "/.vim/bundle/vundle"
  unless File.exists? target
    system("git clone https://github.com/gmarik/vundle.git #{target}")
  end
  puts "Installing Vim Bundles"
  system("vim +BundleInstall +qall")
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.gsub(/\.(symlink|erb)$/, '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub(/\.erb$/, '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file.gsub(/\.symlink$/, '')}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file.gsub(/\.(symlink|erb)$/, '')}"}
  end
end
