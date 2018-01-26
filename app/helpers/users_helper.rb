module UsersHelper
    def gravator_for(user ,size)
       gravator_id = Digest::MD5::hexdigest(user.email.downcase)
       size = 100
       gravator_url = url = "http://gravatar.com/avatar/#{gravator_id}?s=#{size}"
       image_tag(gravator_url, alt: user.username, class: "img-circle") 
    end    
end
