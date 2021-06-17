require 'yaml'
require 'mysql2'

require_relative './lib/database'

config = YAML.load_file('./config/config.yml')
client = Database.new(config['db'])

data = ARGV[0]

result = client.who_in_group(data)

p result
