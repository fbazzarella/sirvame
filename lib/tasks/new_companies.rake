namespace :db do
  namespace :seed do
    desc 'Add new companies to database'
    task :new_companies do
      require 'csv'
      require 'colored'

      puts "Importing all new companies to database...\n"
      count = {saved: 0, ignored: 0}

      CSV.foreach(Rails.root.join('db', 'new_companies.csv')) do |row|
        if Company.find_by_name(row[0]).nil?
          Company.create({name: row[0], phone: row[1], segments: row[2], products: row[3]}, as: :admin)

          print '.'.green
          count[:saved] += 1
        else
          print '.'.yellow
          count[:ignored] += 1
        end
      end

      puts "\nDone! " + "#{count[:saved]} have been saved".green + " and " + "#{count[:ignored]} have been ignored".yellow + "."
    end
  end
end