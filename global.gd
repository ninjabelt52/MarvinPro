extends Node

var camPerspective = true
var botDimentions = Vector3(12,12,12)
var botOrder = []
var currentMousePos
var currentObj

var camera

var numBotsCreated

# Called when the node enters the scene tree for the first time.
func _ready():
	numBotsCreated = 0
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if camera != null:
		var mousePos = get_viewport().get_mouse_position()
		var rayOrigin = camera.project_ray_origin(mousePos)
		var rayEnd = rayOrigin + camera.project_ray_normal(mousePos) * 2000
		var query = PhysicsRayQueryParameters3D.create(rayOrigin, rayEnd)
		
		var spacestate = camera.get_world_3d().direct_space_state
		
		var rayArrary = spacestate.intersect_ray(query)
		
		if rayArrary.has("position"):
			currentMousePos = rayArrary["position"]
			currentObj = rayArrary["collider"]
