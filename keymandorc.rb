start_at_login(true)

disable /VirtualBox/

# Enable/disable Keymando
toggle "<Ctrl-E>"

# Basic mapping
map "<Ctrl-[>", "<Escape>"
map "<Ctrl-m>", "<Ctrl-F2>"

# map "<Cmd-Tab>", nil
# map "<Cmd-Shift-Tab>", nil

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
only /Chrome/, /Firefox/ do
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

# Mac Outlook
only /Outlook/ do
  nmap "#", "<Delete>"
  nmap "c", "<Cmd-n>"
  nmap "y" do
    send("<Cmd-Shift-m>")
    send("Archive<Enter>")
  end
  nmap "v" do
    send("<Cmd-Shift-m>")
  end
end

abbrev 'nname', 'Kevin Colyar'
# abbrev 'ttime' { send(Time.now.strftime('%I:%M%p')) }
# abbrev 'ddate' { send(Time.now.strftime('%m/%d/%Y')) }
# abbrev 'eemail', 'kevin@colyar.net'
# abbrev 'addr', '123 Willow Rd., New York, NY, 122345'

# Spelling Corrections
abbrev 'teh', 'the'
abbrev 'shoudl', 'should'

only /Xcode/ do
  map ',r', '<Cmd-r>'
end

Commands.register LeftClick.instance, 
  RightClick.instance,
  RunHistoryItem.instance,
  LockTheScreen.instance,
  UiControls.instance

command 'Keymando - Reload' do 
  alert('Reloaded Successfully') if reload
end

ApplicationLauncher.register('/System/Library/CoreServices', :max_depth => 1)
ApplicationLauncher.register('/Applications', :max_depth => 2)
ApplicationLauncher.register('/Developer/Applications', :max_depth => 3)
# # 
# ChromeBookmarks.register('/Users/kevinc/Library/Application Support/Google/Chrome/Default/Bookmarks')

command 'Eject Time Machine', :remember => true do
  system('diskutil umount "/Volumes/Time Machine Backups"')
end

command "Chrome - Refresh" do
  activate('Google Chrome')
  send("<Cmd-r>")
end

command "Keymando - Edit Config" do
  system('open /Users/kevinc/.keymandorc.rb')
end

command "Open Dropbox" do 
  system('open /Users/kevinc/Dropbox')
end

def pasteboard
  p = ''
  IO.popen('pbpaste') { |clipboard| p = clipboard.read }
  return p.class == String ? p.dup : ''
end

def pasteboard=(s)
  IO.popen('pbcopy', "w").tap{|io| io.write s}.close
end

command "Finder - Underscorify" do
  send('<Return><Cmd-c>')
  pb = pasteboard
  str = pb.downcase.gsub(/[ -]/, '_')
  pasteboard = str
  send('<Cmd-v><Return>')
end

command "Volume Up" do 
  `osascript -e 'set volume output volume (output volume of (get volume settings) + 7)'`
end

command "Volume Down" do 
  `osascript -e 'set volume output volume (output volume of (get volume settings) - 7)'`
end

map "<Cmd-h>", UiControls.instance

class RunRegisteredCommand                                                                                                                                                                                               
  def run_using(item)                                                                                                                                                                                                    
    item.run                                                                                                                                                                                                             
  end                                                                                                                                                                                                                    
end

map "<Cmd- >" do                                                                                                                                                                                                         
  trigger_item_with(Commands.items, RunRegisteredCommand.new)                                                                                                                                                             
end 

map "<Cmd-.>", RunLastCommand.instance

