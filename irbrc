require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'

ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
