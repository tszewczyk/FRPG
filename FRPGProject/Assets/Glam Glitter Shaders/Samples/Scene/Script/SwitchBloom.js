#pragma strict

private var effect			: Bloom;
private var toggleBloom		: boolean = true;
		
function Start()
{
	effect = GetComponent(Bloom);	
}

function Update()
{
	if (Input.GetKeyDown ("1"))
	{
		if (toggleBloom)
		{
			effect.enabled = false;
			toggleBloom = false;
		}
		else
		{
			effect.enabled = true;
			toggleBloom = true;
		}
	}
}



function OnGUI ()
{
	if(toggleBloom)
	{
		GUI.Box (Rect (10, 10, 380, 25), "[1] enable/disable Bloom effect: Bloom enabled");
	}
	else
	{
		GUI.Box (Rect (10, 10, 380, 25), "[1] enable/disable Bloom effect: Bloom disabled");
	}
}



