extends Sprite2D

var speed = 400  # 移动速度

func _process(delta):
	var velocity = Vector2.ZERO  # 移动方向向量
	
	# 检测按键输入
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	# 如果按了方向键，就移动
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		position += velocity * delta
