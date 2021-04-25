require "./lib/database_connection"

ENV["ENVIRONMENT"] == "test" ? DatabaseConnection.setup("chitter_test") : DatabaseConnection.setup("chitter")