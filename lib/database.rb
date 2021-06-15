class Database
	def initialize(db_params)
		@db_client = Mysql2::Client.new(db_params)
	end

	def who_in_group(group_name)
		cl_query("SELECT name,surname,age,type,group_name FROM people RIGHT JOIN
			        people_groups ON people.id=people_groups.people_id LEFT JOIN
							groups ON people_groups.group_id=groups.id
							WHERE groups.group_name='#{group_name}';")
	end

	def group_list
		cl_query("SELECT group_name FROM groups;")
	end

	private

	attr_reader :db_client

  def cl_query(string)
		db_client.query(string)
	end
end
