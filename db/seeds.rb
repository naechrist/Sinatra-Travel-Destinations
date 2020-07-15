#Create some users 
nae = User.create(name: "Nae", email: "nae@gmail.com", password:"password")
jen = User.create(name: "Jen", email: "jen@gmail.com", password:"password")

#Create some destinations 
TravelDestination.create(content: "Churchill Downs in Louisville, Kentucky", user_id: nae.id)
TravelDestination.create(content: "Grand Canyon in Arizona", user_id: nae.id)

