extends Node2D

@onready var SceneTransitionAnimation2 = $Water_Drains/AnimationPlayer
@onready var anim = get_node("AnimatedSprite2D")
# Called when the node enters the scene tree for the first time.

var fished_fish

var common = 0
var uncommon = 0
var rare = 0
var epic = 0
var legendary = 0

var Coins: int


func _ready():
	SceneTransitionAnimation2.get_parent().get_node("AnimatedSprite2D")
	SceneTransitionAnimation2.play("Water_Drains")
	$Penguin.play("Idle")
	$BasicFish.visible = false
	$Eugene.visible = false
	$ClownFish.visible = false
	$Octopus.visible = false
	$TheLegend.visible = false
	

func _process(delta):
	if Input.is_action_just_pressed("fish"):
		$Rod.play("Fish_Bites")
		$Penguin.play("Angry")
		$Timer.start()
		get_fish_types()
		print(common)
		print(uncommon)
		print(rare)
		print(epic)
		print(legendary) 


func get_fish_types():
	fished_fish = randi_range(0,20)
	if fished_fish <= 9:
		print("You got a common fish")
		common += 1 
		Global.Coins += 5
		$BasicFish.visible = true
		await get_tree().create_timer(1).timeout
		$BasicFish.visible = false
	elif fished_fish >= 10 and fished_fish <= 14:
		print("You got a uncommon Fish")
		uncommon += 1
		Global.Coins += 10
		$Eugene.visible = true
		await get_tree().create_timer(1).timeout
		$Eugene.visible = false
	elif fished_fish >= 15 and fished_fish <= 17:
		print("You got a rare Fish")
		rare += 1
		Global.Coins += 25
		$ClownFish.visible = true
		await get_tree().create_timer(1).timeout
		$ClownFish.visible = false
	elif fished_fish >= 18 and fished_fish <= 19:
		print("You got a epic Fish")
		epic += 1
		Global.Coins += 50
		$Octopus.visible = true
		await get_tree().create_timer(1).timeout
		$Octopus.visible = false
	elif fished_fish == 20:
		print("You got a legendary Fish")
		legendary += 1
		Global.Coins += 100
		$TheLegend.visible = true
		await get_tree().create_timer(1).timeout
		$TheLegend.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_timer_timeout():
	$Penguin.play("Shaking")
	$Rod.play("Fish_On_Line")
