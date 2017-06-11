namespace :load do
  task users: :environment do

    require 'open-uri'
    content = open("http://localhost:3001/api/usuarios").read
    users = JSON.parse(content)

    users.each do |x|
      User.create(
        activation_state: x['activation_state'],
        crypted_password: x['crypted_password'],
        salt:             x['salt'],
        first_name: x['nombre'],
        last_name:  x['apellido'],
        slug:       x['slug'],
        email:      x['email'],
        birth_date: x['fecha_de_nacimiento'],
        role:       'registered_user',
        created_at: x['created_at']
      )
    end

  #  t.string   "email"
  #  t.string   "crypted_password"
  #  t.string   "salt"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #  t.string   "role"
  #  t.string   "first_name"
  #  t.string   "last_name"
  #  t.integer  "visits_count",                    default: 0
  #  t.string   "nationality"
  #  t.date     "birth_date"
  #  t.string   "photo_uid"
  #  t.string   "photo_name"
  #  t.text     "about"
  #  t.string   "slug"
  #  t.string   "activation_state"
  #  t.string   "activation_token"
  ##  t.datetime "activation_token_expires_at"
  #  t.string   "reset_password_token"
  #  t.datetime "reset_password_token_expires_at"
  #  t.datetime "reset_password_email_sent_at"

#"activation_state": "active",
#"activation_token": null,
#"activation_token_expires_at": null,
#"apellido": "Perera",
#"created_at": "2012-05-07T09:50:03-03:00",
#"crypted_password": "$2a$10$Lhw3nioim6oDBEbvnANV2uzdq4Bqn6WqxKQ.6EgyXCw7FjIvS7Y2S",
#"curriculum": "",
#"email": "xavier.perera@xaver.com.ar",
#"es_activo": true,
#"facebook": "Sxadvi",
#"fecha_de_nacimiento": "1987-12-08",
#"foto_name": "647_1064574820419_1407468953_30184809_3868_n.jpg",
#"foto_uid": "production/usuarios/2-foto-200x200.jpg",
#"id": 2,
#"intereses": "",
#"mail_publico": "",
#"nacionalidad": null,
#"nombre": "Xavier",
#"reset_password_email_sent_at": null,
#"reset_password_token": null,
#"reset_password_token_expires_at": null,
#"rol": "colaborador",
#"salt": "vTgPoogUNWGsWTV99sEh",
#"slug": "xavier-perera",
#"twitter": "sxadvi",
#"updated_at": "2012-05-07T10:29:25-03:00",
#"username": "xavier.perera",
#"visitas_count": 0

  end
end
