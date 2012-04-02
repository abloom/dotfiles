require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'

begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError
  $stderr.puts "Please install the wirble gem"
end

begin
  require 'method_lister'
rescue LoadError
  $stderr.puts "Please install the method_lister gem"
end

begin
  require 'interactive_editor'
rescue LoadError
  $stderr.puts "Please install the interactive_editor gem"
end

ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
IRB.conf[:USE_READLINE] = true
