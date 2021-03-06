class OrganizationsController < ApplicationController
    def index
        organizations = Organization.order(created_at: :desc)
        render json: organizations, each_serializer: OrganizationsSerializer, current_user: current_user
    end

    def show
        organization = Organization.find(params[:id])
        render json: organization, serializer: OrganizationSerializer, current_user: current_user
    end

    def update
        organization = Organization.find(params[:id])
        if organization.update(organization_params)
            render json: organization, current_user: current_user
        else 
            render json: { message: "Update Failed", errors: organization.errors.full_messages}
        end
    end

    def create
        if user_id_param_exist?
            create_and_join_organization
        else
            @organization = Organization.new(organization_params)
            if @organization.save
                render json: @organization, current_user: current_user
            else
                render json: { errors: @organization.errors.full_messages }
            end
        end
    end

    def join_organization
        organization = Organization.find(params[:id])
        organization.users << User.find(params[:user_id])
        render json: organization, current_user: current_user
    end

    private

    def organization_params
        params.require(:organization).permit(
            :name,
            :hourly_rate,
            :user_id
        )
    end

    def create_and_join_organization
        @organization = Organization.new(name: organization_params[:name], hourly_rate: organization_params[:hourly_rate])
        if @organization.save
            @organization.users << User.find(organization_params[:user_id])
            render json: @organization, current_user: current_user
        else
            render json: { errors: @organization.errors.full_messages }
        end
    end

    def user_id_param_exist?
        !!organization_params[:user_id]
    end
end