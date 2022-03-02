class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        !!self.freebies.find_by(item_name: item_name)
    end

    def give_away(dev, freebie)
        # freebie.update(dev_id: dev.id) unless freebie.dev != self
        # "This ain't yours"
        # freebie_item_name = freebie.item_name

        # if self.received_one?(freebie.item_name)
        #     freebie.update(dev_id: dev.id)
        # else
        #     "not yours"
        # end

        if self.id == freebie.dev_id
            freebie.update(dev_id: dev.id)
        else
            "not yours"
        end
    end

end
