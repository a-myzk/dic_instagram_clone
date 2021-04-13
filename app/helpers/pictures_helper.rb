module PicturesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_pictures_path
    else action_name == 'edit'
      picture_path
    end
  end
end
