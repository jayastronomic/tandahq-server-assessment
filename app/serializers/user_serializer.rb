class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :email_address, :logged_in

    belongs_to :organization

    def logged_in
      @instance_options[:logged_in]
    end
end