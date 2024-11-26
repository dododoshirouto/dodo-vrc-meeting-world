﻿
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
[UdonBehaviourSyncMode(BehaviourSyncMode.None)]

public class LocalSoundEffect : UdonSharpBehaviour
{

    public AudioSource Audio;
    void Start()
    {
        
    }
    public void SendSoundEvent(){
        //SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All,"PlaySound");
        PlaySound();
    }
    public void PlaySound(){
        if(Audio != null && Audio.clip != null)
        {
            Audio.Stop();
            Audio.PlayOneShot(Audio.clip);
        }
    }
}
