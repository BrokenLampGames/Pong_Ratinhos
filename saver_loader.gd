extends Node
class_name SaverLoader
@onready var player = %Player
@onready var player_2 = $"../../Player2"
@onready var ball = %Ball
@onready var label = %Label
@onready var label_2 = %Label2

	

func _on_save_buttom_pressed():
	var saved_game:SavedGame = SavedGame.new()
	
	saved_game.player_position = player.global_position
	saved_game.player2_position = player_2.global_position
	saved_game.player_score = Main.p1_score
	saved_game.player2_score = Main.p2_score
	ResourceSaver.save(saved_game, "user://savegame.tres")
	##var file = FileAccess.open("res://savegame.data",FileAccess.WRITE)
	##file.store_var(player.global_position)
	##file.store_var(player_2.global_position)
	##file.store_var(Main.p1_score)
	##file.store_var(Main.p2_score)
	##file.close()


func _on_load_button_pressed():
	var saved_game: SavedGame = load("user://savegame.tres") as SavedGame
	player.global_position = saved_game.player_position
	player_2.global_position = saved_game.player2_position
	Main.p1_score = saved_game.player_score
	Main.p2_score = saved_game.player2_score
	
	
	##var file = FileAccess.open("res://savegame.data",FileAccess.READ)
	##player.global_position = file.get_var()
	##player_2.global_position = file.get_var()
	##Main.p1_score = file.get_var()
	##Main.p2_score = file.get_var()
	##file.close()
	
