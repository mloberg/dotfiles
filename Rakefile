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
