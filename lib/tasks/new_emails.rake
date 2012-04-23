namespace :db do
  namespace :seed do
    desc 'Add new emails to database'
    task :new_emails do
      require 'csv'
      require 'colored'

      puts "-----> Importing all new emails to database".green.bold
      count = {saved: 0, ignored: 0}

      CSV.foreach(Rails.root.join('db', 'new_emails.csv')) do |row|
        if Email.find_by_email(row[1]).nil?
          Email.create({name: row[0].split(' ')[0].humanize, email: row[1]})

          print '.'.green
          count[:saved] += 1
        else
          print '.'.red
          count[:ignored] += 1
        end
      end

      puts "\n\n-----> Done! ".yellow.bold + "#{count[:saved]} have been saved".green.bold + " and ".yellow.bold + "#{count[:ignored]} have been ignored".red.bold + ".".yellow.bold
    end
  end
end