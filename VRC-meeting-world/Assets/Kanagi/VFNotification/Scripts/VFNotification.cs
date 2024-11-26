
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

using VRC.SDK3.StringLoading;

public class VFNotification : UdonSharpBehaviour
{
    [SerializeField] private VRCUrl VFNotificationURL;

    private string requestType = null;

    private bool IsRequestingMessageAPI = false;

    void Start()
    {
        var player = Networking.LocalPlayer;

        if (player.IsOwner(this.gameObject))
        {
            this.RequestVFURL("VFNotification", this.VFNotificationURL);
        }
    }

    private void RequestVFURL(string requestType, VRCUrl requestURL)
    {
        if(this.requestType != null) return;

        this.IsRequestingMessageAPI = true;

        this.requestType = requestType;

        UdonBehaviour ub = (UdonBehaviour) this.gameObject.GetComponent(typeof(UdonBehaviour));
        VRC.SDK3.StringLoading.VRCStringDownloader.LoadUrl(requestURL,ub);
    }

    public override void OnStringLoadSuccess(IVRCStringDownload result)
    {
        base.OnStringLoadSuccess(result);

        switch(this.requestType)
        {
            case "VFNotification":
                Debug.Log("[towa] [VF] Notification Success.");
            break;
        }

        this.requestType = null;
        this.IsRequestingMessageAPI = false;
    }

    public override void OnStringLoadError(IVRCStringDownload result)
    {
        base.OnStringLoadError(result);

        this.requestType = null;
        this.IsRequestingMessageAPI = false;
    }
}
