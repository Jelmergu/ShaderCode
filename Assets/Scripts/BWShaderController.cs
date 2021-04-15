using UnityEngine;
using System.Collections;

[ExecuteInEditMode]
public class BWShaderController : MonoBehaviour {

    [Range(0.0f, 1.0f)]
    public float color = 1f;
    public float transitionSpeed = 1f;

    float blendValue = 1f;
    private Material material;

    // Creates a private material used to the effect
    void Awake ()
    {
        material = new Material( Shader.Find("ScreenShaders/BWShader"));
        blendValue = color;
    }
    
    private void Update() {
        blendValue = Mathf.Lerp(blendValue,color,Time.deltaTime*transitionSpeed);
    }
    // Postprocess the image
    void OnRenderImage (RenderTexture source, RenderTexture destination)
    {
        material.SetFloat("colorAmount", blendValue);

        Graphics.Blit (source, destination, material);
    }
}