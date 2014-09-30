

using UnityEngine;
using System.Collections;

public class SteppingSound : MonoBehaviour {

	public AudioClip[] stepsound;
	public float nextFootTiming;
	private GameObject dustObject;
	private ParticleSystem dust;
	private double tempTime;
	private CharacterController controller;

	void Awake () {
		controller = GetComponent<CharacterController> ();
		dustObject = GameObject.Find("foot dust particle system");
		dust = dustObject.GetComponent<ParticleSystem>();
		tempTime = 0.0f;
	}

	void Update () {
//		Debug.Log ("nextFootTiming" + nextFootTiming);
////		Debug.Log ("system time" + Time.time);
//		Debug.Log ("tempTIme:" + tempTime);
		if (Input.GetKey ("w") && tempTime <= Time.time) {
				Debug.Log ("PLAYING FOOTSTEP");
				tempTime = Time.time + nextFootTiming;

				audio.PlayOneShot (stepsound [0], 1);
				dust.Play();
		}
		else {
			dust.Stop();
		}

	}
}
