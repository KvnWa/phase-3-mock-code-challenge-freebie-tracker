class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        Freebie.create(dev_id: dev.id, item_name: item_name, value: value, company_id: self.id)
    end

    #Company.first.give_freebie(Dev.first, "Thermometer", 30)

    def self.oldest_company
        Company.all.order(:founding_year).first
    end

    

end
