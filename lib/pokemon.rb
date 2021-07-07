require 'sqlite3'
require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db 

  def initialize(id:, name:, type:, db:)
    @db = db
    @id, @name, @type = id, name, type
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = #{id}").flatten
    Pokemon.new(id: id, name: poke[1], type: poke[2], db: db)
  end  

end

binding.pry
0