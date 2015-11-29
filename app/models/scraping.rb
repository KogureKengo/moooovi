class Scraping
  require 'mechanize'

def self.movie_urls
  agent = Mechanize.new

  page = agent.get("http://eiga.com/now/")
  elements = page.search('.m_unit h3 a')

  elements.each do |ele|
    link = ele.get_attribute('href')
    link_page = agent.get("http://eiga.com" + link)
    
    title_ele = link_page.at('.moveInfoBox h1').inner_text
    
    image_ele = link_page.at('.pictBox a img').get_attribute('src')

    director_ele = link_page.at('.staffBox dd a span').inner_text

    detail_ele = link_page.at('.outline p').inner_text



    puts director_ele
  end

end

end