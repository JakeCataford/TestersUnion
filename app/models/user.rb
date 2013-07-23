class User < ActiveRecord::Base

  def gravatar_url(size=nil)
    return unless email.present?
    gravatar_id = Digest::MD5.hexdigest(email)
    "http://gravatar.com/avatar/#{ gravatar_id }.png?s=#{ size || 32 }&d=mm"
  end
end
