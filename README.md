# Fast Track

Fast Track is a web application which provides users with relevant data to support their evaluation and purchasing decisions. This project is regarded as an exploratory initiative towards learning Kafka, Rails, and service oriented architecture.

# Start up
TBD

# Specification
* Ruby 2.6.3
* Rails 6.0.2.1

# Gems
* Open-uri
* Nokogiri
* Bootstrap 4.4.1
* Jquery-rails 4.3.5
* Resque 1.27.0
* Resque-scheduler
* ruby-kafka -- Used as an Apache Kafka client library
* racecar -- Used as a framework for consumers in the publisher-subscriber system

# TODO
* Fix product table onClick refresh
* Consider 'SOLD OUT' use case
* Fix the collection of prices >$1000

# Feature Planning
## ReactJS Implementation
* A few front-end features would be better suited using ReactJS
* Integrate ReactJS using webpack gem

## Improved UX
* Add features such as notifications, popovers, etc. indicating that new relevant data has been received
* Implement a graph of price points for historical analysis
