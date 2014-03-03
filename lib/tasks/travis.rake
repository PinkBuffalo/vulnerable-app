namespace :travis do
  DB_NAME = "vulnerable_test"

  desc "Setup travis postgresql db"
  task :setup do
    puts "Creating db.yml..."
    File.open('config/database.yml', 'w') do |f|
      f.write("test:\n")
      f.write("  adapter: postgresql\n")
      f.write("  database: #{DB_NAME}\n")
      f.write("  username: postgres\n")
    end
  end

  task :spinup do
    puts "Spinning up database..."
    `psql -c 'create database #{DB_NAME};' -U postgres`
  end
end
