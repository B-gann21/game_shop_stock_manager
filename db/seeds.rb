VideoGame.destroy_all
GameShop.destroy_all

gamestop = GameShop.create(name: "GameStop", does_repairs: false, stock_limit: 5)
level7games = GameShop.create(name: "Level 7 Games", does_repairs: true, stock_limit: 4)
gamezone = GameShop.create(name: "GAME ZONE", does_repairs: false, stock_limit: 6)

doom_2016 = gamestop.video_games.create(name: "DOOM 2016", rating: "M", price: 50, multiplayer: false)
doom_eternal = gamestop.video_games.create(name: "DOOM Eternal", rating: "M", price: 55, multiplayer: true)
fifa_2020 = gamestop.video_games.create(name: "FIFA 2020", rating: "E 10+", price: 60, multiplayer: true)
hawks_pro_skater = gamestop.video_games.create(name: "Tony Hawk's Pro Skater", rating: "T", price: 40, multiplayer: false)
hawks_pro_skater2 = gamestop.video_games.create(name: "Tony Hawk's Pro Skater 2", rating: "T", price: 45, multiplayer: false)

rocket_league = level7games.video_games.create(name: "Rocket League", rating: "E", price: 20, multiplayer: true)
animal_crossing = level7games.video_games.create(name: "Animal Crossing: New Leaf", rating: "E", price: 60, multiplayer: true)
blasphemous = level7games.video_games.create(name: "Blasphemous", rating: "M", price: 40, multiplayer: false)
mario_kart = level7games.video_games.create(name: "Mario Kart 8 Deluxe", rating: "E 10+", price: 50, multiplayer: true)

mw_2019 = gamezone.video_games.create(name: "Modern Warfare 2019", rating: "M", price: 50, multiplayer: true)
back4blood = gamezone.video_games.create(name: "Back 4 Blood", rating: "M", price: 60, multiplayer: true)
dying_light2 = gamezone.video_games.create(name: "Dying Light 2", rating: "M", price: 70, multiplayer: true)
horizon_west = gamezone.video_games.create(name: "Horizon: Forbidden West", rating: "T", price: 60, multiplayer: true)
horizon_dawn = gamezone.video_games.create(name: "Horizon: Zero Dawn", rating: "T", price: 50, multiplayer: true)
ark_evolved = gamezone.video_games.create(name: "Ark: Survival Evolved", rating: "M", price: 50, multiplayer: true)
