class ShiftSerializer < ActiveModel::Serializer
    attributes :id, :start, :finish, :break_length, :shift_date, :hours_worked, :shift_cost, :user_name

    def shift_date
        "#{object.shift_date.month}/#{object.shift_date.day}/#{object.shift_date.year}"
    end

    def start
        object.start.strftime("%l:%M%P").delete(" ") if object.present? 
    end

    def finish
        object.finish.strftime("%l:%M%P").delete(" ") if object.present?
    end

    def hours_worked
        (((object.finish - object.start) - (object.break_length * 60)) / 3600).floor(2) if object.present?
    end
    
    def shift_cost
       (object.user.organization.hourly_rate * hours_worked).floor(2) if object.user.organization.present? 
    end
    
    def user_name
        object.user.name
    end
    
end