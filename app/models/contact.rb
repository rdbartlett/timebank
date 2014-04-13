class Contact < ActiveRecord::Base
  attr_accessible :details, :name
  def self.import(file)
    Contact.delete_all
    CSV.foreach(file.path, headers: true) do |row|
      imported_row = row.to_hash.extract!("First Name", "Surname", "Preferred contact")
      merged = {"name" => "#{imported_row["First Name"]} #{imported_row["Surname"]}", "details" => "#{imported_row["Preferred contact"]}"}
      Contact.create!(merged)
    end
  end
end
