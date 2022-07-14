class ShiftsController < ApplicationController


    def create  
        shift = Shift.new(shifts_params)
        if shift.save
            render json: shift
        else
            render json: { message: "FAILED"}
        end
    end


    private

    def shifts_params
        params.require(:shift).permit(
            :user_id,
            :start,
            :finish,
            :break_length,
            :shift_date
        )
    end
end
