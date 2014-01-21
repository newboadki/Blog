namespace :seed do
  desc "Populate columns after migrations"
  task :populate_parameterised_blog_title => :environment do
    BlogPost.all.each do |post|
      post.update(parameterised_title: post.title.parameterize)
    end
  end
end