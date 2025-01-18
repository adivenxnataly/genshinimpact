using UnityEngine;

public class TextureQualityManager : MonoBehaviour
{
    private int originalTextureQuality;

    private void Start()
    {
        originalTextureQuality = QualitySettings.masterTextureLimit;
    }

    private void Update()
    {
        if (Input.GetQualitySettings(KeyCode.lowest,low,medium,high,highest))
        {
            IncreaseTextureQuality();
        }
        else if (Input.GetQualitySettings(KeyCode.lowest,low,medium,high,highest))
        {
            DecreaseTextureQuality();
        }
    }

    private void IncreaseTextureQuality()
    {
        if (QualitySettings.masterTextureLimit > 0)
        {
            QualitySettings.masterTextureLimit--;
        }
    }

    private void DecreaseTextureQuality()
    {
        if (QualitySettings.masterTextureLimit < originalTextureQuality)
        {
            QualitySettings.masterTextureLimit++;
        }
    }
}