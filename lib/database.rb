class Database
	def initialize(db_params)
		@db_client = Mysql2::Client.new(db_params)
	end

	def who_in_group(group_name)
		@db_client.query("SELECT name,surname,age,type,group_name FROM people RIGHT JOIN people_groups ON people.id=people_groups.people_id LEFT JOIN groups ON people_groups.group_id=groups.id WHERE groups.group_name='#{group_name}';")
	end

	def group_list
		@db_client.query("SELECT group_name FROM groups;")
	end
end

def people_view
	'row["name"] row["surname"] row["age"] row["type"] row["group_name"]'
end

def show_group(sql_rows)
	sql_rows.each do |row|
		puts row["group_name"]
	end
end

def show_all(sql_rows)
	sql_rows.each do |row|
		puts "#{row["name"]} #{row["surname"]} #{row["age"]} #{row["type"]} #{row["group_name"]}"
	end
end
