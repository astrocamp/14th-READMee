module ResumesHelper
  def display_avatar_base64(profile)
    if profile.avatar.attached?
      image = profile.avatar.variant(:thumb).processed
      base64_data = Base64.strict_encode64(image.download)
      image_tag("data:image/jpeg;base64,#{base64_data}", class: "mx-auto")
    else
      image_tag("defaultuser.png", class: "rounded-full w-32 h-32 mx-auto")
    end
  end
end
