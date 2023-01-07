puts 'Creating a project'
ProjectServices::CreateProjectService.new.call

project = Project.last

puts "Project created in the following directory #{project.base_directory}"
