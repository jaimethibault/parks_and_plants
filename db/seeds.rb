require 'open-uri'
require 'nokogiri'

url = "http://pexels.com/search/plants/"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.photo-item__link img').each do |element|
  image_url = element.attr('src')
  if image_url =~ /^https?:\/\/(.*)/
    Plant.create!(name: "Toto", image_url: image_url, garden_id: 1)
    puts "created"
  else
    puts "not created"
  end
end
