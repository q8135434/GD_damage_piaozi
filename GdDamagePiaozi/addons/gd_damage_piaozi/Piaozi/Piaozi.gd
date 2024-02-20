extends Node2D

var float_piaozi := preload("res://addons/gd_damage_piaozi/Piaozi/marker_2d_float/marker_2d_float.tscn")

func _on_button_pressed() -> void:
	
	var damage_info := {
		"dir":-1,
		"damage":[
			[-120,false],
			[-50,false],
			[-500,true],
			[1000,false]
		]
	}
	start_piaozi(damage_info)
	pass # Replace with function body.


#飘字
func start_piaozi(_damage_info:Dictionary) -> void :
	#伤害是数组 所以高度得传进来且递增
	var damages :Array = _damage_info["damage"]
	var gaodu   := -130
	
	
	for info in damages:
		var ft := float_piaozi.instantiate()
		ft.global_position = Vector2($Label.global_position.x,$Label.global_position.y-50)
		
		var damage = info[0]
		var baoji  = info[1]
		
		if damage > 0 :
			ft.text = "+" + str(damage)
			ft.modulate = Color.PALE_GREEN
		else :
			ft.text = str(damage)
			#处理是否暴击
			if baoji:
				ft.modulate = Color.ORANGE_RED
			else :
				ft.modulate = Color.ALICE_BLUE
		
		#向左向右漂浮
		var dir = randi_range(30 ,1) * _damage_info["dir"]
		
		ft.velocity = Vector2(dir,gaodu)
		ft.gravity  = Vector2(0,1.5)
		add_child(ft)
		#递增高度
		gaodu -= 40
		#延迟下
		await get_tree().create_timer(.1).timeout
	pass

