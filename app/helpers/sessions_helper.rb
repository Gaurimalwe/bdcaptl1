module SessionsHelper
def remember(owner)
    owner.remember
    cookies.permanent.signed[:owner_id] = owner.id
    cookies.permanent[:remember_token] = owner.remember_token
  end
end
