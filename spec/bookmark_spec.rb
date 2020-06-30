require './lib/bookmarks.rb'

describe Bookmarks do
  describe "#all" do
    it "should return all bookmarks held in the instance" do
      bookmarks = Bookmarks.new
      expect(bookmarks.all).to eql(['http://www.makersacademy.com','http://www.google.com','http://www.destroyallsoftware.com']) 
    end
  end
end
