class Scraping
  require 'mechanize'

  def self.movie_urls
    agent = Mechanize.new
    url = "/now/"

    while true do
      page = agent.get("http://eiga.com" + url)
      elements = page.search('.m_unit h3 a')

      elements.each do |ele|
        link = ele.get_attribute('href')
        link_page = agent.get("http://eiga.com" + link)
        
        title_ele = link_page.at('.moveInfoBox h1').inner_text
        image_ele = link_page.at('.pictBox a img').get_attribute('src') if link_page.at('.pictBox a img')
        director_ele = link_page.at('.staffBox dd a span').inner_text if link_page.at('.staffBox dd a span')
        detail_ele = link_page.at('.outline p').inner_text if link_page.at('.outline p')
        open_ele = link_page.at('.opn_date strong').inner_text if link_page.at('.opn_date strong')

        product = Product.where(title: title_ele, image_url:image_ele, director:director_ele, detail:detail_ele, open_date:open_ele).first_or_initialize
        product.title = title_ele
        product.director = director_ele
        product.detail = detail_ele
        product.open_date = open_ele
        product.save
      end

      if page.at('.next_page')
          url = page.at('.next_page').get_attribute('href')
          puts url
      else
          break
      end

    end

  end

end