require 'csv'

class ReportExporter
  include Rails.application.routes.url_helpers

  def get_values
    most_comments_id = Comment.group(:article_id)
                              .count.max_by { |k, v| v }.try { |k, v| k }
    @article = Article.find(most_comments_id)
  end

  def put_values
    get_values
    File.open("generated-files/report_#{DateTime.now}.html", 'w') do |report|
      report.puts "<p> Кол-во авторов: #{Author.all.length} </p>"
      report.puts "<p> Кол-во статей: #{Article.all.length} </p>"    
      report.puts "<p> Кол-во комментариев: #{Comment.all.length} </p>"
      report.puts "Среднее число комментариев: 
        #{Comment.all.length / Article.all.length} <br>"
      report.puts "<a href='http://localhost:3000#{article_path(@article.id)}'>
                    #{@article.title}
                  </a><br>"

      report.puts "Тег | Кол-во упоминаний"
      Tag.all.each do |t|
        report.puts "<p> #{t.name} | #{t.articles.count} </p>"
      end
    end
  end 
end


desc 'Update db'
task :reseed do
  Rake::Task['db:reset'].invoke
end

desc 'Create list of users with email'
task :user_list => :environment do
  attributes = %w{name email}
  @authors = Author.all
  CSV.open("generated-files/user_list_#{DateTime.now}.csv", 'w') do |file|
    file << attributes
    @authors.each do |author|
      file << [author.name, author.email]
    end
  end    
end

desc 'Create HTML report'
task report: :environment do
  full_report = ReportExporter.new
  full_report.put_values 
end

