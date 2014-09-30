#pragma strict

var rotationSpeed	: float = 20;

function Update ()
{
	transform.Rotate(Vector3.up * Time.deltaTime * rotationSpeed);
}