class Service < ActiveRecord::Base
  attr_accessible :body, :contact, :name, :title, :service_type
  def self.import(file)
    Service.delete_all
    CSV.foreach(file.path, headers: true) do |row|
      imported_row = row.to_hash.extract!("Offer/Request", "First Name", "Last Name", "Title", "Body")
      merged = {"service_type" => imported_row["Offer/Request"],
                "title" => imported_row["Title"],
                "body" => imported_row["Body"],
                "name" => "#{imported_row["First Name"].strip} #{imported_row["Last Name"]}"}
      Service.create!(merged) unless Service.where(body: merged["body"], title: merged["title"]).exists?
    end
  end

end
