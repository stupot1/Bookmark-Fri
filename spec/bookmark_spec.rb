require './lib/bookmarks.rb'

describe Bookmarks do
  describe "#all" do
    it "should return all bookmarks held in the instance" do
      bookmarks = Bookmarks.new
      expect(bookmarks.all).to eql(["http://www.wikipedia.org"]) 
    end
  end
end
