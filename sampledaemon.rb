# ruby script copyright Beepscore LLC 2010
# To use:
#   cd /hw2_1
#   ruby sampledaemon.rb
#
# References:
# http://linux-certification.blogspot.com/2008/10/using-shell-commands-in-ruby.html
# http://ruby-doc.org/stdlib/libdoc/net/telnet/rdoc/index.html
require 'net/telnet'

def list_daemon
  list_string = "launchctl list | grep .*sampledaemon"
  system list_string
end

def unload_daemon
  puts "unload_daemon"
  unload_string = "launchctl unload edu.uwce.sampledaemon.plist"
  system unload_string
end

def load_daemon
  puts "load_daemon"
  load_string = "launchctl load edu.uwce.sampledaemon.plist"
  system load_string
  # sleep 0.5
end

def start_telnet

  localhost = Net::Telnet::new('Host' => 'localhost',
                                'Port' => 2342,
                                'Timeout' => 2.0,
                                'Waittime' => 0.0,
                                'Prompt'  => "you",
                                'Telnetmode' => true)

  # FIXME: script gets first response from daemon and then hangs
  # ..net/telnet.rb:557:in `waitfor': timed out while waiting for more data (Timeout::Error)
  localhost.cmd("Hi from ruby script")  { |c| print c }

  # send telnet escape control-]
  puts "\c]"

  localhost.close

  # quit telnet to return to bash shell
  puts "quit"
end

# if deamon is loaded, unload it
if list_daemon
  unload_daemon
end

load_daemon
list_daemon

start_telnet

unload_daemon
list_daemon

