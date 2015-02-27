# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create email: 'admin@example.com', password: 'password'

seed_file = Rails.root.join('db', 'seeds', 'ned', 'ned1.yml')
config = YAML::load_file(seed_file)
ordr = 0
config.each do |mtask|
 ordr +=1
 unt = Unit.find_or_create_by(name: mtask['unit'])
 meta = Homework::Meta::Base.create unit: unt

 meta_task = Homework::Meta::Task.create(task_class: mtask['task_class'], meta: meta, description: mtask['description'], order: ordr, table_head: mtask['table_head'])
  if mtask['task_class']=='Table'
    mtask['rows'].each do |row|
      Homework::Meta::Row.create(meta_task: meta_task, meta_cells: row['cells'], name:row['name'], colspan: row['colspan'])
    end
  end
end