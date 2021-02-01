require "csv"

class Comment
  attr_accessor :author, :content, :id

  def initialize(author, content, id)
    @content = content
    @author = author
    @id = id
  end

  def save
    CSV.open((File.expand_path("./db/comments.csv")), "ab") do |f|
      f << [@author, @content, @id]
    end
  end

  def self.all
    all_comments = []
    CSV.read("./db/comments.csv").each do |csv_line|
      all_comments << Comment.new(csv_line[0], csv_line[1], csv_line[2])
    end
    return all_comments
  end

end