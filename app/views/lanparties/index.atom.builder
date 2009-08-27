atom_feed do |feed|
  feed.title("LAN parties")
  feed.updated(@lanparties.first.created_at)

  @lanparties.each do |lanparty|
    feed.entry(lanparty) do |entry|
      entry.title(lanparty.title)
      entry.content(lanparty.description, :type => 'html')
#      entry.content(textilize(lanparty.description), :type => 'html')
#entry.author do |author|
#       author.name("Michael Gorsuch")
#     end
    end
  end
end
