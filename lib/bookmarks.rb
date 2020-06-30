require 'pg'

class Bookmarks

  def initialize
    @bookmarks = ["http://www.wikipedia.org"]
  end

  def all
    begin
      con = PG.connect :dbname => 'bookmark_manager', :user => 'jamesforster'
      
      rs = con.exec "SELECT * FROM bookmarks"

      array = []
  
      rs.each do |row|
        array << row["url"]
      end

      array
      
    rescue PG::Error => e
      puts e.message 
    
    ensure
      rs.clear if rs
      con.close if con
    end
  end
end