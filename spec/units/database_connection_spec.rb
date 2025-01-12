require 'database_connection'

describe DatabaseConnection do
    describe '.setup' do
      it 'sets up a database connection using PG' do
        db = "chitter_test"
        described_class.setup(db)
        expect(DatabaseConnection.db).to be_a PG::Connection
      end
  
      it 'persists the database connection' do
        connection = DatabaseConnection.setup('chitter_test')
        expect(DatabaseConnection.db).to eq connection
      end
    end
  
    describe '.query(sql)' do
      it 'executes a given SQL query using PG' do
        connection = DatabaseConnection.setup('chitter_test')
        sql = "SELECT * FROM peeps"
  
        expect(connection).to receive(:exec).with(sql)
        DatabaseConnection.query(sql)
      end
    end
  end