using UnityEngine;

public class FPSController : MonoBehaviour
{
    public int targetFPS = 60;

    private void Start()
    {
        Application.targetFrameRate = targetFPS;
    }

    private void Update()
    {
        if (Application.targetFrameRate < targetFPS)
        {
            QualitySettings.DecreaseLevel();
        }
        else if (Application.targetFrameRate > targetFPS)
        {
            QualitySettings.IncreaseLevel();
        }
    }
}
