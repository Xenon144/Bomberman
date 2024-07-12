extends Label

var time_left = 200 # Объявляем переменную и устанавливаем начальное значение
var timer = null # Объявляем переменную для хранения ссылки на таймер

func _ready():
	self.text = "TIME " + str(time_left) # Устанавливаем начальное значение времени
	timer = get_node("Timer") # Получаем ссылку на узел Timer
	timer.start()
	
func _on_timer_timeout():
	time_left -= 1
	self.text = "TIME " + str(time_left) # Обновляем текст с текущим временем
	if time_left <= 0:
		timer.stop()
		self.text = "TIME 0" # Можно изменить сообщение, когда время вышло
