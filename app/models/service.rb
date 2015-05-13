class Service < ActiveRecord::Base
  attr_accessible :body, :contact, :name, :title, :service_type, :category
  def self.import(file)
    Service.delete_all
    CSV.foreach(file.path, headers: true) do |row|
      imported_row = row.to_hash.extract!("Ad Type", "First Name", "Last Name", "Top-Level Category", "Ad Title", "Ad Body")
      merged = {"service_type" => imported_row["Ad Type"],
                "category" => imported_row["Top-Level Category"],
                "title" => imported_row["Ad Title"],
                "body" => imported_row["Ad Body"],
                "name" => "#{imported_row["First Name"].strip} #{imported_row["Last Name"]}"}
      Service.create!(merged) unless Service.where(body: merged["body"], title: merged["title"]).exists?
    end
  end

end
