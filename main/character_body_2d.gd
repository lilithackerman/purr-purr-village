extends CharacterBody2D

@export var speed: int = 50  # 移动速度

func get_input():
	# 获取键盘输入（WASD 或 方向键）
	var horizontal = Input.get_axis("ui_left", "ui_right")
	var vertical = Input.get_axis("ui_up", "ui_down")
	velocity = Vector2(horizontal, vertical) * speed

func update_animation():
	# 获取你节点下的 AnimatedSprite2D
	var anim = $AnimatedSprite2D
	
	if velocity.length() > 0:
		# 如果正在移动，播放行走动画
		anim.play("walk-up")
		# 翻转角色（朝左或朝右）
		if velocity.x > 0:
			anim.flip_h = false  # 朝右
		elif velocity.x < 0:
			anim.flip_h = true   # 朝左
	else:
		# 如果站着不动，停止动画（或播放待机动画）
		anim.stop()

func _physics_process(delta):
	get_input()
	print(velocity)
	move_and_slide()  # 内置移动函数
	update_animation()  # 更新动画状态
