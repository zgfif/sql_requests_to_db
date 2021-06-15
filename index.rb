require 'yaml'
require 'mysql2'

require_relative './lib/database'

config = YAML.load_file('./config/config.yml')
client = Database.new(config['db'])

data = ARGV[0]

result = client.who_in_group(data)

case result.count
when 0
	result=client.group_list
	puts "Sorry, couldn't find information about \"#{data}\" class.\nThe school has only #{result.count} classes:"
	show_group(result)
else
	show_all(result)
end
