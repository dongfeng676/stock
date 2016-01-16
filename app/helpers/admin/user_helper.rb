module Admin::UserHelper
  def user_rand
    [["铜","铜"],["银","银"],["金","金"],["钻","钻"]]
  end

  def user_image(user)
    if user.images.present?
      image = user.images.first
      image.image.url
    end
  end
end
