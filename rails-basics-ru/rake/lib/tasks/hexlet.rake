require 'csv'

namespace :hexlet do
  desc "Load users into DB from .csv fixture"
  task :import_users do
    table = CSV.parse(File.read("test/fixtures/files/users.csv"), headers: true)

    table.each do |row|
      user_data = {
        first_name: row['first_name'],
        last_name: row['last_name'],
        birthday: Date.strptime(row['birthday'], '%m/%d/%Y'),
        email: row['email']
      }
      
      User.create(user_data)
    end
  end
end
