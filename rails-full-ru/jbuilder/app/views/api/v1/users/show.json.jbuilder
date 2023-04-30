json.(@user, :id, :email, :address)
json.email "#{@user.first_name} #{@user.last_name}"
json.psts @user.posts
json.posts @user.posts, partial: 'api/v1/users/posts', as: :post
