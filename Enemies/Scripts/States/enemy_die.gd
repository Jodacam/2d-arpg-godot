class_name EnemyDie extends EnemyState

func enter_state() ->void :
	enemy.velocity = Vector2.ZERO
	enemy.animation_player.play("die")
	enemy.animation_player.animation_finished.connect(on_end_animation)
	pass
func on_end_animation(_d) -> void:
	enemy.animation_player.animation_finished.disconnect(on_end_animation)
	enemy.queue_free()
	pass
