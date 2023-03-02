class ActivitiesController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

def index
    
    activities = Activity.all
    render json: activities
end

# def show
#     if params[:signup_id]
#         signup = Signup.find(params[:signup_id])
#         activity = signup.activity
#         byebug
#     else
#         activity = Activity.find(params[:id])
#     end
#     render json: activity, include: :signup

#     # activity = find_activity
#     # render json: activity 
# end


def destroy
    # activity = Activity.find_by!(id: params[:id])
    # activity.destroy
    # render json: activity
    activity = find_activity
    if activity
        activity.destroy
        head :no_content
    else 
        render json: {error: "Activity not found" }, status: :not_found
    end

end


private

    def find_activity
        Activity.find_by(id: params[:id])
    end


end