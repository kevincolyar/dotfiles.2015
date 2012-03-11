start_at_login(true)

def send_keys(keys)
   lambda{send(keys)}
end
def lock_the_screen
  lambda{lock_screen}
end
def display_message(message)
  lambda{alert(message)}
end
def reload_configuration
  lambda{ growl("Configuration reloaded successfully") if reload}
end

# Keymando can ignore entire applications

disable /VirtualBox/

# Enable/disable Keymando
toggle "<Ctrl-E>"

# Basic mapping
map "<Ctrl-[>", "<Escape>"
map "<Ctrl-m>", "<Ctrl-F2>"

# Lets disable those pesky arrows 
# in a couple different ways.
# map "<Up>", nil
# map "<Down>", noop
# %w(<Left> <Right>).each { |k| map k, nil }

# The following mappings are valid 
# except for these application(s)
except /iTerm/, "MacVim" do
  map "<Ctrl-j>", "<Down>"
  map "<Ctrl-k>", "<Up>"
  map "<Ctrl-h>", "<Left>"
  map "<Ctrl-l>", "<Right>"
  map "<Ctrl-f>", "<PageUp>"
  map "<Ctrl-b>", "<PageDown>"

  map "<Ctrl-Shift-j>", "<Shift-Down>"
  map "<Ctrl-Shift-k>", "<Shift-Up>"
  map "<Ctrl-Shift-h>", "<Shift-Left>"
  map "<Ctrl-Shift-l>", "<Shift-Right>"

  # Right mouse click
  map "<Ctrl-r>" do 
    left_click
    # alert(mouse_x)
  end

end

# Disable quiting for iTerm.  Should only exit via command line
only /iTerm/ do
  map "<Cmd-w>", nil
  map "<Cmd-q>", nil
  map "<Cmd-r>", nil
  map "<Cmd-t>", nil
end

# The following mappings are only valid for
# the given application(s)
only /Chrome/ do
  map "<Ctrl-h>", "<Cmd-{>"
  map "<Ctrl-l>", "<Cmd-}>"
  map '<Ctrl-a>p', '<Cmd-{>'
  map '<Ctrl-a>n', '<Cmd-}>'
  map '<Ctrl-w>h', '<Cmd-{>'
  map '<Ctrl-w>l', '<Cmd-}>'
  map "<Ctrl-u>", "<PageUp>"
  map "<Ctrl-d>", "<PageDown>"
  map ',r', '<Cmd-r>'
  map ',t', '<Cmd-t>'
  map ',l', '<Cmd-y>'
  map ',w', '<Cmd-w>'
end


# Reload .keymandorc.rb
# map "<Ctrl-R>" { reload }

# You can speak
map "<Ctrl-S>" { say "Hello, world." }

# Confirmations
map "<Cmd-Ctrl-l>" do  
  if confirm("Lock screen?") 
    say "Goodbye for now!"
    lock_screen 
  end
end

map "<Ctrl-T>" do  
  type(Time.now.strftime('%I:%M%p'))
end

# Blocks
map "<Ctrl-W>" do 
  alert("hello")
  alert("world")
end

# You can use uppercase or Shift
map "<Ctrl-Shift-q>" do 
  alert("hello")
  alert("world")
end


# Type out entire cords
# map "abc", type("alphabet")
# map "nname", type("Kevin Colyar")

# Application switching
# map "<Cmd-p>" { application_previous }
# map "<Cmd-n>" { application_next }

# map "<Cmd-n>" do 
#   input do |answer|
#     if answer == "screenshot"
#       send("<Cmd-Shift-3>") 
#       alert("Screenshot Taken!")
#     end
# 
#   end
#   # alert(input())
# end

#imap "<Cmd-t>" do
#  alert('Input Mode Only')
#end
#
#nmap "<Cmd-t>" do
#  alert('Normal Mode Only')
#end


only 'TextEdit' do 
  # map 'test', 'hello'
  # map 'c', 'cat'
  # map ':w', '<Cmd-s>'
  # map 'test', lambda { alert('haha')}
end

map "<Cmd-Shift-.>" { growl('Hello, World') }

# Mac Outlook
only /Outlook/ do
  nmap "#", "<Delete>"
  nmap "c", "<Cmd-n>"
  nmap "y" do
    send("<Cmd-Shift-m>")
    send("Archive<Enter>")
  end
end

map "<Ctrl-f>" { get_controls }

# only "Mail" do 
#   nmap "c", "<Cmd-n>"                  # New message
#   nmap "j", "<Down>"                   # Down
#   nmap "k", "<Up>"                     # Up
#   nmap "e", "<Shift-Cmd-e>"            # Archive
#   nmap "<Shift-3>", "<Cmd-Backspace>"  # Delete
#   nmap "s", "<Shift-Cmd-l>"            # Star
#   nmap "r", "<Cmd-r>"                  # Reply
#   nmap "a", "<Shift-Cmd-r>"            # Reply all
#   nmap "f", "<Shift-Cmd-f>"            # Forward
#   nmap "z", "<Cmd-z>"                  # Undo
#   nmap "U", "<Shift-Cmd-u>"            # Mark as unread
#   nmap "<Cmd-Enter>", "<Shift-Cmd-d>"  # Send message
#   nmap "!", "Shift-Cmd-j>"             # Mark as junk
# end
# 

only /TextEdit/ do
  abbrev "nname", "Kevin Colyar"
end
abbrev 'nname', 'Kevin Colyar'
abbrev 'ttime' { send(Time.now.strftime('%I:%M%p')) }
abbrev 'ddate' { send(Time.now.strftime('%m/%d/%Y')) }
abbrev 'eemail', 'kevin@colyar.net'

abbrev 'addr', '1123 Fuller St., Wenatchee, WA, 98801'
abbrev 'teh', 'the'
abbrev 'shoudl', 'should'

map '<cmd-down>' { alert(Keymando.version)}

only /Xcode/ do
  map ',r', '<Cmd-r>'
end

# abbrev 'cclass' do 
#   name = prompt("Enter Class Name")
#   template = "class #{name}<Return>  def initialize()<Return>  end<Return>end"
#   send(template)
# end

# abbrev 'test' do 
#   pasteBoard = NSPasteboard.generalPasteboard
#   pasteBoard.declareTypes([NSStringPboardType], owner: nil)
#   pasteBoard.setString('ಠ_ಠ', forType: NSStringPboardType)
#   send('<Cmd-v>')
# end

# only /TextEdit/ do
#   map "a" { alert ("a") }
#   map "b" { growl("a unmapped"); unmap ("a") } 
# end


# only /TextEdit/ do
#   swap('Cmd', 'Alt')
# end
#

# map "<Alt-k>" { alert Spotify.methods}
# map "<Alt-k>" { Keychain.unlock }
map "<Alt-j>" { ITunes.volume_down }
map "<Alt-k>" { ITunes.volume_up }


 # map "<Cmd-b>t" { Quicksilver.large_type Time.now.strftime('%y/%m/%d %H:%M %a')}
 # map "<Cmd-b>d" { Quicksilver.large_type Time.now.strftime('%m/%d %A') }
 # map "<Cmd-b>l" { Quicksilver.large_type "I Love U" }

only /Quicksilver/ do
  map "<alt-l>" { alert('test')}
end

# NEW STUFF -------------

Commands.register LeftClick.instance, 
  RightClick.instance,
  RunHistoryItem.instance,
  LockTheScreen.instance,
  UiControls.instance


command 'Keymando - Reload' { alert('Reloaded Successfully') if reload }

ApplicationLauncher.register('/System/Library/CoreServices', :max_depth => 1)
ApplicationLauncher.register('/Applications', :max_depth => 2)
ApplicationLauncher.register('/Developer/Applications', :max_depth => 3)

# ChromeBookmarks.register('/Users/kevinc/Library/Application Support/Google/Chrome/Default/Bookmarks')

# map "<Cmd-d>", current_app_windows
# map "<Cmd-f>", trigger_app
 
command 'Eject Time Machine', :remember => true do
  system('diskutil umount "/Volumes/Time Machine Backups"')
end

command "Chrome - Refresh" do
  activate('Google Chrome')
  send("<Cmd-r>")
end

command "Keymando - Edit Config" do
  system('open /home/kevinc/.keymandorc.rb')
end

command "Open Dropbox" do 
  open('/home/kevinc/.keymandorc.rb')
end

command "Finder - Underscorify" do
  send('<Return><Cmd-c>')
  IO.popen('pbpaste') { |clipboard| p = clipboard.read }
  return if p.nil?
  s = p.downcase.gsub(/[ -]/, '_')
  IO.popen('pbcopy', "w").tap{|io| io.write s}.close
  send('<Cmd-v><Return>')
end

map "<Cmd-h>", UiControls.instance

class RunRegisteredCommand                                                                                                                                                                                               
  def run_using(item)                                                                                                                                                                                                    
    item.run                                                                                                                                                                                                             
  end                                                                                                                                                                                                                    
end

class RunBrowserCommand
  def run_using(item)
    system("open \"#{item.url}\"")
  end
end


class UrlItem
  attr_reader :url
  def initialize(desc, url)
    @desc = desc
    @url = url
  end
  def to_s
    @desc
  end
end

# map "<Cmd- >", launch_app

map "<Cmd- >" do                                                                                                                                                                                                         
  trigger_item_with(Commands.items,RunRegisteredCommand.new)                                                                                                                                                             
end 

# bookmarks = [UrlItem.new('Google', 'http://www.google.com')]
# 
# command "Bookmarks" do 
#   trigger_item_with(bookmarks, RunBrowserCommand.new)
# end

map "<Cmd-.>",RunLastCommand.instance
