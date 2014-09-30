/////////////
// this can be attached to an empty object to spawn an already
// existing object. not perfected, but seems to work
/////////////
#pragma strict

var zombiePrefab : GameObject; // prefab to spawn
var zombiesSpawned : int; // zombies spawned
var player : GameObject; // player
var spawn : boolean;
var minWait : int;
var maxWait : int;
var waitTime : int;

function Start(){
	minWait = 1;
	maxWait = 10;
	// set waitTime to a random range between min and max
	waitTime = Random.Range(minWait, maxWait);
	spawn = true;
}

function Update() {
	if(spawn)
	{
		Spawn();
	}
}

function Spawn(){
	// spawn
	//creat object (what you are instantiating, where, where)
	
	Instantiate(zombiePrefab, transform.position, transform.rotation);
	zombiesSpawned+=1;
	NewWaitTime();
	spawn = false;
	SetSpawn();
}

function SetSpawn(){
	// reset the spawn variable after spawn
	yield WaitForSeconds(waitTime);
	spawn = true;
}

function NewWaitTime(){
	waitTime = Random.Range(minWait, maxWait);
}