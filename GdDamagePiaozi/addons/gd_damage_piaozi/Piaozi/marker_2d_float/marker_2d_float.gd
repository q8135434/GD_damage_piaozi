extends Marker2D

var text :String:
	get:
		return $Label.text
	set(v):
		$Label.text = v

#速度
var velocity := Vector2.ZERO
#重力
var gravity  := Vector2(0,1.5)
#质量
var mass     :float = 200.0
#初始位置 
var orignal_pos :Vector2

func _process(delta: float) -> void:
	velocity += mass * gravity * delta
	global_position += velocity * delta
	if global_position.y > orignal_pos.y + 20 :
		clear_self()
	
func _ready() -> void:
	orignal_pos = global_position
	
func clear_self() -> void :
	var twenn = create_tween()
	twenn.tween_property(self,"modulate",Color(modulate.r,modulate.g,modulate.b,0),.2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_LINEAR)
	await twenn.finished
	queue_free()
