#ifdef GL_ES
precision mediump float;
#endif

#define PROCESSING_COLOR_SHADER

uniform vec2 u_resolution;
uniform vec2 u_mouse;   
uniform float u_time;

uniform vec3 blr;
uniform vec3 sz;
uniform vec3 clr;

uniform int shape;

void main() {
    vec2 ms = gl_FragCoord.xy/u_mouse;
    vec2 st = gl_FragCoord.xy/u_resolution;
    
    float y;
    
    if (shape == 1) {
        y = step(sz.x,st.x);
    }
    
    if (shape == 2) {
        y = step(sz.x,st.y);
    }
    
    if (shape == 3) {
        y = step(sz.x,st.x*st.y);
    }
    
    if (shape > 0) {
        vec3 color = vec3(y);
        color = y*vec3(clr.x, clr.y, clr.z);
        gl_FragColor = vec4(color, 1.0);
    } else {
        gl_FragColor = vec4(clr.x, clr.y, clr.z, 1.0);
    }
}