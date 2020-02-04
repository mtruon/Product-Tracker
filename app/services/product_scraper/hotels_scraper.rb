module ProductScraper
  class HotelsScraper < Scraper
    def scrape
      begin
        create_doc()
        html_scrape_for(prices)
      rescue
        return 0.00
      end
    end

    private
      def prices
        @doc.css('div#book-info-container').css('.current-price')
      end
  end
end
