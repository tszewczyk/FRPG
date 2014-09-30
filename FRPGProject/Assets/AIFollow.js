////////////////
// this can be attached to a gameobject to track a player(target to follow must have tagged name as "player")
////////////////
#pragma strict

var target : Transform;
var moveSpeed = 3;
var rotationSpeed = 3;
var myTransform : Transform;

// as soon as game starts
function Awake()
{
	myTransform = transform;
}

function Start()
{
	target = GameObject.FindWithTag("Player").transform;
}

function Update(){
	// transform in vector for jumping and stuff
	transform.LookAt(Vector3(target.position.x, transform.position.y, target.position.z));
	// means move
	myTransform.Translate(Vector3.forward * moveSpeed * Time.deltaTime);
}