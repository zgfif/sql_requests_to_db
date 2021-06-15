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
		puts "#{row["name"]} #{row["surname"]} #{row["age"]}
		       #{row["type"]} #{row["group_name"]}"
	end
end
