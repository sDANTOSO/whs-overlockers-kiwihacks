extends Node

var totalColectables: int = 0;

func new_collectable():
	totalColectables+=1;

func reduce_collectables():
	print("reduction");
	totalColectables-=1;
	if totalColectables <= 0:
		# win
		print("win");
		pass
