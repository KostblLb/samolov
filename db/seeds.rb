# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create email: 'admin@example.com', password: 'password'

ordr = 0

Dir.glob('db/seeds/homeworks/valid/*.yml') do |file|
  config = YAML::load_file(file)
  if config
    config.each do |meta_progress|
      ordr +=1
      meta = Homework::Meta::Progress.create name: meta_progress['unit']
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
  end
end
