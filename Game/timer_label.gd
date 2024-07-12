extends Label

var time_left = 200
var timer
var timer_label

func _ready():
	# Получаем ссылку на объект Label на сцене
	timer_label = get_node("timer_label")
	timer_label.text = str(time_left)
	timer = Timer.new()
	timer.set_wait_time(1)
	timer.set_one_shot(false)
	timer.connect("timeout", self, "_on_timer_timeout")
	add_child(timer)
	timer.start()

func _on_timer_timeout():
	time_left -= 1
	timer_label.text = str(time_left)

	if time_left <= 0:
		timer.stop()
