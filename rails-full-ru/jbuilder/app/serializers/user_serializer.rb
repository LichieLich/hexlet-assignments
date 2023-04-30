class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :address

  def full_name
    "#{@user.first_name} #{@user.last_name}"
  end

  has_many :posts
end
