Fabricator(:user) do
  first_name   { "admin" }
  last_name { "admin"}
  email {" fodder@example.com"}
  password { "admin" }
  salt { "asdasdastr4325234324sdfds" }
  crypted_password { Sorcery::CryptoProviders::BCrypt.encrypt("secret",
                     "asdasdastr4325234324sdfds") }
end
