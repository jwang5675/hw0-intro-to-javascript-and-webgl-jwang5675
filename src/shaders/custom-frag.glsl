#version 300 es

// This is a fragment shader. If you've opened this file first, please
// open and read lambert.vert.glsl before reading on.
// Unlike the vertex shader, the fragment shader actually does compute
// the shading of geometry. For every pixel in your program's output
// screen, the fragment shader is run for every bit of geometry that
// particular pixel overlaps. By implicitly interpolating the position
// data passed into the fragment shader by the vertex shader, the fragment shader
// can compute what color to apply to its pixel based on things like vertex
// position, light position, and vertex color.
precision highp float;

uniform vec4 u_Color; // The color with which to render this instance of geometry.

uniform float u_Time;

// These are the interpolated values out of the rasterizer, so you can't know
// their specific values without knowing the vertices that contributed to them
in vec4 fs_Pos;
in vec4 fs_Nor;
in vec4 fs_LightVec;
in vec4 fs_Col;

out vec4 out_Col; // This is the final output color that you will see on your
                  // screen for the pixel that is currently being processed.

void main()
{
    float x = 0.3 * cos(0.001 * u_Time) + 0.3 * sin(fs_Pos[0]) + 0.2;
    float y = 0.3 * sin(0.001 * u_Time) + 0.3 * cos(fs_Pos[1]) + 0.2;
    float z = 0.3 * sin(0.001 * u_Time) + 0.3 * sin(fs_Pos[2]) + 0.2;
    out_Col = vec4(x, y, z, 1.0);
}
