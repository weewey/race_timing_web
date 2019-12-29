class ApiUser < User
  devise :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

end
