require_relative "./database_connection"


class Peep
  attr_reader :id, :message, :create_date

  def initialize(id: ,message: , create_date: )
    @id = id
    @message = message
    @create_date = create_date
  end

  def self.all
    queried_data = DatabaseConnection.query("SELECT * FROM peeps ORDER BY create_date DESC")
    queried_data.map { |peep| 
        Peep.new(id: peep["id"], message: peep["message"], create_date: peep["create_date"])
    }
  end

  def self.create(message:)
    queried_data = DatabaseConnection.query("INSERT INTO peeps(message) VALUES('#{message}') RETURNING id, message, create_date")
    Peep.new(id: queried_data[0]["id"], message: queried_data[0]["message"], create_date: queried_data[0]["create_date"] )
  end
end