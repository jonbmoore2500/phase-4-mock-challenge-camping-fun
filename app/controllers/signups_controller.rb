class SignupsController < ApplicationController

    def create
        signup = Signup.create(signups_params)
        if signup.valid?
            activity = signup.activity
            render json: activity, status: :created
        else
            render json: {errors: signup.errors.full_messages }, status: :unprocessable_entity
        end
    end


private 

    def signups_params
        params.permit(:camper_id, :activity_id, :time)
    end

end