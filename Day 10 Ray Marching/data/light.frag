#ifdef GL_ES
precision mediump float;
#endif

#define PROCESSING_COLOR_SHADER
#define MAX_STEPS 100
#define MAX_DIST 100.0
#define SURFACE_DIST 0.01

uniform vec2 u_resolution;
uniform vec2 u_mouse;   
uniform float u_time;

uniform float sphereSize = 1.0;
uniform vec2 sphereLocation = vec2(0, 6);
uniform vec3 lightColor = vec3(1.0, 1.0, 1.0);

float GetDist(vec3 point) {
    // Set sphere location
    vec4 spherePos = vec4(sphereLocation.x, sphereSize, sphereLocation.y, sphereSize);
    
    // Calculate sphere distance
    float sphereDist = length(point - spherePos.xyz) - spherePos.w;
    
    // Calculate plane distance
    float planeDist = point.y;
    
    // Calculate total distance
    float dist = min(sphereDist, planeDist);
    
    return dist;
}

float RayMarch(vec3 rOrigin, vec3 rDirection) {
    float distFromOrigin = 0.0;
    
    for (int i = 0; i < MAX_STEPS; i++) {
        vec3 hitPoint = rOrigin + distFromOrigin * rDirection;
        float dist = GetDist(hitPoint);
        distFromOrigin += dist;
        
        if (dist < SURFACE_DIST || distFromOrigin > MAX_DIST) { break; }
    }
    
    return distFromOrigin;
}

vec3 GetNormal(vec3 point) {
    float dist = GetDist(point);
    vec2 e = vec2(0.01, 0.0);
    vec3 normal = dist - vec3(
        GetDist(point - e.xyy),
        GetDist(point - e.yxy),
        GetDist(point - e.yyx)
        );
    
    return normalize(normal);
}

float GetLight(vec3 point) {
    vec3 lightPos = vec3(0, 5, 6);
    
    // Make light move in a circle around
    lightPos.xz += vec2(sin(u_time), cos(u_time)) * 3.0;
    
    vec3 light = normalize(lightPos - point);
    vec3 normal = GetNormal(point);
    
    float difLight = clamp(dot(normal, light), 0.0, 1.0);
    
    // For shadows
    float dist = RayMarch(point + normal * SURFACE_DIST * 2.0, light);
    if (dist < length(lightPos - point)) {
        difLight *= 0.1;
    }
    return difLight;
}

void main() {
    vec2 ms = gl_FragCoord.xy/u_mouse;
    vec2 uv = (gl_FragCoord.xy - 0.5 * u_resolution.xy)/u_resolution.y;
    
    vec3 color = vec3(0);
    
    // Set camera position
    vec3 rayOrigin = vec3(0, 1, 0);
    vec3 rayDirection = normalize(vec3(uv.x, uv.y, 1));

    float dist = RayMarch(rayOrigin, rayDirection);
    vec3 lightPoint = rayOrigin + rayDirection * dist;
    
    // Get diffuse lighting
    float difLight = GetLight(lightPoint);
    
    color = vec3(difLight) * lightColor;
    
    // Output to screen
    gl_FragColor = vec4(color, 1.0);
}

