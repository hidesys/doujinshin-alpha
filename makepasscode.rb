require "yaml"

safe_str = "ACDEFGHJKNPRSTWXY3456"
safe_chars = safe_str.split(//)

passcodes = []
100.times do |i|
  passcode = ""
  7.times do |j|
    passcode += safe_chars.sample
  end
  passcodes << passcode
end

YAML.dump(passcodes, File.open("passcodes.yml", "w"))

