User.find_or_create_by!(email_address: "admin@stockcontrol.com") do |user|
  user.nombre = "Admin"
  user.password = "password123"
  user.password_confirmation = "password123"
  user.rol = :admin
end

User.find_or_create_by!(email_address: "miembro@stockcontrol.com") do |user|
  user.nombre = "Miembro"
  user.password = "password123"
  user.password_confirmation = "password123"
  user.rol = :miembro
end
