class Pokemon
  attr_accessor :id, :name, :type, :hp, :db


  def initialize(id=0, name, type, hp, db)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, database_connection)
    #the use of question marks protects against attacks to database
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id,database_connection)
    #why does "... pokemon.id=id" pass tests?
    database_connection.execute("SELECT * FROM pokemon WHERE pokemon.id=?", id)
  end

  def self.knows_default_hp(id,database_connection)
    database_connection.execute("SELECT hp FROM pokemon WHERE id = (?)", id)
  end

end
