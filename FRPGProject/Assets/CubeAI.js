///////////////
// this can be attached to gameobject like cube to use as a enemy
// with health and collision
///////////////

#pragma strict

var health = 3;
var TakeDamage : boolean;
var Health3 : Texture2D;
var Health2 : Texture2D;
var Health1 : Texture2D;
var texturewidth : int;
var textureheight : int;
var texturewidth2 : int;
var textureheight2 : int;
var texturewidth1 : int;
var textureheight1 : int;

function OnTriggerEnter(other : Collider){
	if(other.tag == "Player"){
		TakeDamage = true;
		}
}		

function OnTriggerExit(other: Collider){
	if(other.tag == "Player"){
		TakeDamage = false;
		}
}

function Update(){
	if(TakeDamage){
		if(Input.GetButtonDown("Fire1")){
			health--;
			}
	}
	if(health < 1){
	print("Enemy Down!");
	health = 0;
	Destroy(gameObject);
	}
}

function OnGUI(){
	if(health == 3){
		GUI.Label(Rect(10,40,texturewidth,textureheight),Health3);
	}
	if(health == 2){
		GUI.Label(Rect(10,40,texturewidth,textureheight),Health2);
	}
	if(health == 1){
		GUI.Label(Rect(10,40,texturewidth,textureheight),Health1);
	}
}

