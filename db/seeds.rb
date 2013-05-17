5.times do
  Entry.create! name: "Matz"
  Entry.create! name: "Yehuda Katz"
  Entry.create! name: "DHH"
  Entry.create! name: "Jose Valim"
  Entry.create! name: "Dr Nic"
  Entry.create! name: "John Nunemaker"
  Entry.create! name: "Aaron Patterson"

  Post.create! title: "Good article", content: "<b>Some text</b>"
  Post.create! title: "The best article", content: "<b>Some article text</b>"
  Post.create! title: "Article for children", content: "<b>Some article for children</b>"
  Post.create! title: "The fresh news", content: "<b>Some text from the news</b>"
end
