require 'pg'

class Bookmarks

  def self.all

      con = db_connect
      rs = con.exec "SELECT * FROM bookmarks"
      array = []
  
      rs.each do |row|
        array << row["url"]
      end
      db_con_cleanup(rs, con)
      array

  end

  def self.add(input)
      con = db_connect
      rs = con.exec "INSERT INTO bookmarks (url) VALUES ('#{input}')"
      db_con_cleanup(rs, con)
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

  def self.db_con_cleanup(rs, con)
    rs.clear if rs
    con.close if con
  end

end



