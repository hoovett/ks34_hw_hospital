require 'csv'

namespace :import do
  desc "Import data from hospitals.csv file"
  task hospitals: :environment do
    file_path = 'hospitals.csv'
    csv_data = CSV.read(file_path, headers: true, encoding: 'UTF-8')

    num_threads = 3
    threads = []

    rows_per_thread = csv_data.length / num_threads
    remaining_rows = csv_data.length % num_threads
    start_index = 0

    num_threads.times do |i|
      rows = rows_per_thread
      rows += 1 if i < remaining_rows
      thread_data = csv_data.slice(start_index, rows)

      threads << Thread.new(thread_data) do |data|
        data.each do |row|
          Hospital.create(
            name: row["Facility.Name"],
            address: row["Facility.State"],
            phone: "1",
            street: row["Facility.City"]
          )
        end
      end
      start_index += rows
    end

    threads.each(&:join)
  end
end