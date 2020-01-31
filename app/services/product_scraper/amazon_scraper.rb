module ProductScraper
  class AmazonScraper < Scraper
    def scrape
      begin
        create_doc()
        html_scrape_for(prices)
      rescue
        puts "0.00"
      end
    end

    private
      def prices
        @doc.css('div#price').css('span#priceblock_ourprice')
      end
  end
end
