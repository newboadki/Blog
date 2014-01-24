namespace :seed do
  desc "Populate columns after migrations"
  task :populate_parameterised_blog_title => :environment do
    include RakeTasksHelper
    RakeTasksHelper.populate_parameterised_blog_post_title    
  end
end