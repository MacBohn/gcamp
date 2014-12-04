bad_memberships = Membership.where(user_id: nil)

bad_memberships.destroy_all
