require 'rake'
require 'erb'

task :default => :install

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README.rdoc LICENSE git.yml zsh-syntax-highlighting].include? file
    
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
      if replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file)
    end
  end

  update_git_submodules
  link_zsh_syntax_highlighting
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def link_zsh_syntax_highlighting
  system("ln -s $PWD/zsh-syntax-highlighting $PWD/oh-my-zsh/plugins/zsh-syntax-highlighting")
end

def update_git_submodules
  puts "Updating git submodules..."
  system "git submodule init"
  system "git submodule update"
end
