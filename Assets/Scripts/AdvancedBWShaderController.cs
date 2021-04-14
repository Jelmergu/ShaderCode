using UnityEngine;
using System.Collections;

[ExecuteInEditMode]
public class AdvancedBWShaderController : MonoBehaviour {

    [Range(0.0f, 1.0f)]
    public float rBlend = 1f;
    [Range(0.0f, 1.0f)]
    public float gBlend = 1f;
    [Range(0.0f, 1.0f)]
    public float bBlend = 1f;

    public float transitionSpeed = 1f;

    Vector3 blendValues = new Vector3(0,0,0);
    private Material material;

    // Creates a private material used to the effect
    void Awake ()
    {
        material = new Material( Shader.Find("ScreenShaders/AdvancedBWShader"));
        blendValues = new Vector3(rBlend,gBlend,bBlend);
    }
    
    private void Update() {
        blendValues = Vector3.Lerp(blendValues,new Vector3(rBlend,gBlend,bBlend),Time.deltaTime*transitionSpeed);
    }
    // Postprocess the image
    void OnRenderImage (RenderTexture source, RenderTexture destination)
    {
        material.SetFloat("rBlend", blendValues.x);
        material.SetFloat("gBlend", blendValues.y);
        material.SetFloat("bBlend", blendValues.z);

        Graphics.Blit (source, destination, material);
    }
}