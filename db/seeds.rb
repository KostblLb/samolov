# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create email: 'admin@example.com', password: 'password'



Dir.glob('db/seeds/homeworks/valid/*.yml') do |file|
  config = YAML::load_file(file)
  if config
    order = 0
    config.each do |meta_progress|
      meta = Homework::Meta::Progress.create name: meta_progress['unit']
      meta_progress['meta_tasks'].each do |meta_task|
        order +=1
        task = Homework::Meta::Task.create(meta: meta, description: meta_task['description'], order: order)
        suborder = 0
        meta_task['subtasks'].each do |meta_subtask|
          suborder +=1
          if meta_subtask['task_class']=='Table'
            subtask = Homework::Meta::Subtask::Table.create(task: task, task_class: meta_subtask['task_class'],
                                                   description: meta_subtask['description'], order: suborder,
                                                   col_names: meta_subtask['col_names'])
            meta_subtask['rows'].each do |row|
              Homework::Meta::Subtask::Row.create(meta_task: subtask, meta_cells: row['cells'], name:row['name'],
                                                  colspan: row['colspan'], rowspan: row['rowspan'])
            end
          end
          if meta_subtask['task_class']=='Text'
            Homework::Meta::Subtask::Text.create(task: task, task_class: meta_subtask['task_class'],
                                                 description: meta_subtask['description'], order: suborder)
          end
          if meta_subtask['task_class']=='Fish'
            Homework::Meta::Subtask::Fish.create(task: task, task_class: meta_subtask['task_class'],
                                                 description: meta_subtask['description'], order: suborder)
          end
          if meta_subtask['task_class']=='PositionProfile'
            Homework::Meta::Subtask::PositionProfile.create(task: task, task_class: meta_subtask['task_class'],
                                                 description: meta_subtask['description'], order: suborder)
          end
          if meta_subtask['task_class']=='Multiline'
              Homework::Meta::Subtask::Multiline.create(task: task, task_class: meta_subtask['task_class'],
                                                   description: meta_subtask['description'], order: suborder,
                                                   lines: meta_subtask['lines'], line_names: meta_subtask['line_names'])
          end
          if meta_subtask['task_class']=='Select'
            subtask = Homework::Meta::Subtask::Select.create(task: task, task_class: meta_subtask['task_class'],
                                                      description: meta_subtask['description'], order: suborder,
                                                      single: meta_subtask['single'], name: meta_subtask['name'])
            meta_subtask['options'].each do |option|
              Homework::Meta::Subtask::Option.create(select: subtask, answer: option)
            end
          end

        end
      end
    end
  end
end
