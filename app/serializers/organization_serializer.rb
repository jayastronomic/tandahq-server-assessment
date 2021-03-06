class OrganizationSerializer < ActiveModel::Serializer
    attributes :id, :name, :hourly_rate, :auth_user_joined

    has_many :shifts
    
    def auth_user_joined
        if object.users.where(id: @instance_options[:current_user].id).exists?
            true
        else
            false
        end
    end
end