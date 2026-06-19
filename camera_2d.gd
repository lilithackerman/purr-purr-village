extends Camera2D

@export var target: Node2D  # 要跟随的目标节点（在Inspector里把Player拖进来）
@export var follow_speed: float = 5.0  # 跟随速度，数值越大跟得越紧

func _ready():
	# 将这个摄像机设置为当前活动摄像机
	make_current()

func _process(delta):
	if target:
		# 使用 lerp 线性插值实现平滑移动
		global_position = global_position.lerp(target.global_position, follow_speed * delta)
