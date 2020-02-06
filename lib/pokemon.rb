require "sqlite3"
require 'pry'
# require_relative "sql_runner"



# db = SQLite3::Database.new("pokemon.db") 
# db.execute("CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT")


class Pokemon

    attr_accessor  :id, :name, :type, :db

    @@all = []

    def initialize(id:, name:, type:, db: )
        @id = id
        @name = name
        @type = type
         @db = db
        @@all << self
    end

     def self.save(name, type, db)
         db.execute("INSERT INTO pokemon('name', 'type') VALUES(?, ?)", name, type)
     end

     def self.find(id, db)
        pokemon_inf = db.execute("SELECT * FROM pokemon WHERE id IS ?", id).flatten
        Pokemon.new(id: id, name: pokemon_inf[1], type: pokemon_inf[2], db: db)
     end

     def self.all
        @@all
     end


end


