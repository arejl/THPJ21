require "csv"
require 'pry'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open((File.expand_path("./db/gossip.csv")), "ab") do |f|
      f << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(n)
    return self.all[n]
  end

  def self.update(author, content, id)
    all_gossips = self.all
    all_gossips[id].content = content
    all_gossips[id].author = author
    File.open("./db/gossip.csv", "w") {|file| file.truncate(0)}
    all_gossips.each do |gossip|
      gossip.save
    end
  end
end