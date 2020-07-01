require 'pg'

class Bookmarks

  # def initialize
  #   @bookmarks = ["http://www.wikipedia.org","http://www.bbc.co.uk"]
  # end

  def self.all
    begin
      if ENV['RACK_ENV'] == 'test'
        con = PG.connect :dbname => 'bookmark_manager_test', :user => 'arav'  
      else
        con = PG.connect :dbname => 'bookmark_manager', :user => 'arav'
      end
      
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