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
config.each do |meta_progress|
  ordr +=1
  unt = Unit.find_or_create_by(name: meta_progress['unit'])
  meta = Homework::Meta::Progress.create unit: unt
  meta_progress['meta_bases'].each do |mtask|
    if mtask['task_class']=='Table'
      meta_task = Homework::Meta::Table.create(task_class: mtask['task_class'], meta: meta, description: mtask['description'], order: ordr, col_names: mtask['col_names'])
      mtask['rows'].each do |row|
        Homework::Meta::Row.create(meta_task: meta_task, meta_cells: row['cells'], name:row['name'], colspan: row['colspan'])
      end
    else
      Homework::Meta::Text.create(task_class: mtask['task_class'], meta: meta, description: mtask['description'], order: ordr)
    end
  end
end