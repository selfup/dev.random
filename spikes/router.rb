# https://gist.github.com/selfup/badadac1553575f9775202d4cf1c12d3

require 'json'

non_rejected = []
rejected = []
macs = []

results = {
  :rejected_login_count => 0,
  :rejected_mac_addrs => [],
  :common_dates => [],
  :attempted_dates => [],
}

File.read("tmp/router.log").each_line do |line|
  is_rejected = line.include?('rejected')
  
  rejected << line if is_rejected
  non_rejected << line if !is_rejected
end

rejected.each do |log|
  macs << log.split('from MAC ')[1].split(', ')[0]

  split_log = log.split(', ')
  date = split_log[1] + " " + split_log[2].split("\n")[0]
  common_signature = date.split(',')[0]

  results[:attempted_dates] << date
  results[:common_dates] << common_signature
end

# data set is small being real lazy here
results[:attempted_dates] = results[:attempted_dates].uniq
results[:common_dates] = results[:common_dates].uniq
results[:rejected_login_count] = rejected.length

puts "Rejected Logins: #{results[:rejected_login_count]}"
puts "MAC ADDRESSES REJECTED THAT TRIED TO ACCESS NETWORK:"

macs.uniq.each do |mac_addr|
  puts mac_addr
  results[:rejected_mac_addrs] << mac_addr

  non_rejected.each do |non|
    if non.include?(mac_addr)
      puts "!!! Rejected that made it to the network: #{mac_addr}"
    end
  end
end

File.write("tmp/.router.rejected.json", JSON.pretty_generate(results))
File.write("tmp/.router.rejected.log", rejected.join(''))
