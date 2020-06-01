#ifdef GL_ES
precision mediump float;
#endif

#define PROCESSING_COLOR_SHADER

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
    vec2 ms = gl_FragCoord.xy/u_mouse;
    vec2 st = gl_FragCoord.xy/u_resolution;
    
    gl_FragColor = vec4(ms.x, 0, ms.y, 1.0);
}