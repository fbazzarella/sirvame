namespace :companies do
  def import!(*what)
    require 'csv'
    require 'colored'

    what = *what

    if what.any?
      puts "Importing companies to database...".bold
      count = {saved: 0, ignored: 0}

      what.each do |what|
        CSV.foreach(Rails.root.join('db', "#{what.to_s}_companies.csv")) do |row|
          if Company.find_by_name(row[0]).nil?
            Company.create({
              name:     row[0],
              phone:    row[1],
              segments: row[2],
              products: row[3],
              plan:     'none'
            }, as: :import)

            print '.'.green
            count[:saved] += 1
          else
            print '.'.red
            count[:ignored] += 1
          end
        end
      end

      puts "\nDone! #{count[:saved]} saved and #{count[:ignored]} ignored.".bold
    end
  end

  desc 'Add all companies to database'
  task all: :environment do
    import! :new, :old
  end

  desc 'Add new companies to database'
  task new: :environment do
    import! :new
  end

  desc 'Add old companies to database'
  task old: :environment do
    import! :old
  end
end