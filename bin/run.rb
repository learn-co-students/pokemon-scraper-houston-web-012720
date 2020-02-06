require_relative "environment"
require 'pry'

scr = Scraper.new(@db).scrape



all_pokemon = @db.execute("SELECT * FROM pokemon;")

pp all_pokemon

# test out your code here!
