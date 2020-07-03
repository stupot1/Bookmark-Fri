require 'pg'

class Bookmarks

  attr_reader :url, :id, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all

      rs = db_connect.exec "SELECT * FROM bookmarks"
      rs.map { |bookmark| Bookmarks.new(bookmark['id'], bookmark['url'], bookmark['title'])}

  end

  def self.add(url, title)
      db_connect.exec "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}')"
  end

  private

  def self.db_connect
    user = 'postgres'
    password = '123'

    if ENV['RACK_ENV'] == 'test'
      PG.connect :dbname => 'bookmark_manager_test', :user => user, :password => password  
    else
      PG.connect :dbname => 'bookmark_manager', :user => user, :password => password  
    end

  end

end



