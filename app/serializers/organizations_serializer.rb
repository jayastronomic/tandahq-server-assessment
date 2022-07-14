class OrganizationsSerializer < ActiveModel::Serializer
    attributes :id, :name, :hourly_rate, :auth_user_joined

    def auth_user_joined
        if object.users.where(@instance_options[:current_user]).exists?
            true
        else
            false
        end
    end
end