#!/usr/bin/ruby
# require 'irb/completion'
# require 'irb/ext/save-history'
# require 'rubygems'
# require 'interactive_editor'
# 
# IRB.conf[:SAVE_HISTORY] = 1000
# IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
# 
# IRB.conf[:PROMPT_MODE] = :SIMPLE
# 
# %w[rubygems looksee/shortcuts wirble].each do |gem|
#   begin
#     require gem
#   rescue LoadError
#   end
# end
# 
# class Object
#   # list methods which aren't in superclass
#   def local_methods(obj = self)
#     (obj.methods - obj.class.superclass.instance_methods).sort
#   end
#   
#   # print documentation
#   #
#   #   ri 'Array#pop'
#   #   Array.ri
#   #   Array.ri :pop
#   #   arr.ri :pop
#   def ri(method = nil)
#     unless method && method =~ /^[A-Z]/ # if class isn't specified
#       klass = self.kind_of?(Class) ? name : self.class.name
#       method = [klass, method].compact.join('#')
#     end
#     puts `ri '#{method}'`
#   end
# end
# 
# def copy(str)
#   IO.popen('pbcopy', 'w') { |f| f << str.to_s }
# end
# 
# def copy_history
#   history = Readline::HISTORY.entries
#   index = history.rindex("exit") || -1
#   content = history[(index+1)..-2].join("\\n")
#   puts content
#   copy content
# end
# 
# def paste
#   `pbpaste`
# end
# 
# # Color Coding
# # http://www.alloycode.com/2010/6/26/automatic-color-coding-for-script-console-and-irb
# begin
#   require "ap"
#   IRB::Irb.class_eval do
#     def output_value
#       ap @context.last_value
#     end
#   end
# rescue LoadError => e
#   puts "ap gem not found.  Try typing 'gem install awesome_print' to get super-fancy output."
# end
# 
# load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV']
#
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
