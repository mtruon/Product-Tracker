# Product Tracker

Product Tracker is a web application which provides users with relevant data to support their evaluation and purchasing decisions.

# Specification
* Ruby 2.6.3
* Rails 6.0.2.1

# Gems
* Open-uri
* Nokogiri
* Bootstrap 4.4.1
* Jquery-rails 4.3.5
* karafka
* delivery_boy
* racercar

# TODO
* Fix product table onClick refresh
* Consider 'SOLD OUT' use case

# Feature Planning
## Kafka Implementation
* Leverage ruby-kafka, deliveryboy, and racecar gem to build out data pipeline
* Consider karafka gem
* Products are segregated by domains and into their respective topics
* Products publish their information and is consumed by the app
* Current implementation of the ruby scraper is to be integrated into the application using a service object (in-design)

## ReactJS Implementation
* A few front-end features would be better suited using ReactJS
* Integrate ReactJS using webpack gem
