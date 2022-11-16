#version 410

layout (location = 0) in vec3 position;
layout (location = 1) in vec4 tangent;
layout (location = 2) in vec3 normal;
layout (location = 3) in vec2 uv;

uniform vec3 lightDir;
uniform vec3 lightColor;
uniform vec3 meshColor;

out vec2 fragUV;
out mat3 TBN;

uniform mat4 mvp; 
uniform mat3 normalMatrix;


void main()
{
    gl_Position = mvp * vec4(position, 1.0);
    fragUV = vec2(uv.x, 1 - uv.y);

    vec3 T = normalize(normalMatrix * tangent.xyz);
    vec3 B = normalize(normalMatrix * cross(tangent.xyz, normal));
    vec3 N = normalize(normalMatrix * normal);

    TBN = mat3(T, B, N);
}

/*
#version 410

layout (location = 0) in vec3 position;
layout (location = 1) in vec4 tangent;
layout (location = 2) in vec3 normal;
layout (location = 3) in vec2 uv;

out vec2 fragUV;
out vec3 fragWorldPos;
out vec3 fragNormal;
out mat3 TBN;

uniform mat4 mvp;
uniform mat4 model;
uniform mat3 normalMatrix;

void main()
{
    gl_Position = mvp * vec4(position, 1.0);
    fragWorldPos = (model * vec4(position, 1.0)).xyz;

    fragUV = vec2(uv.x, 1 - uv.y);
    
    vec3 T = normalize(normalMatrix * tangent.xyz);
    vec3 B = normalize(normalMatrix * cross(tangent.xyz, normal));
    vec3 N = normalize(normalMatrix * normal);

    TBN = mat3(T, B, N);

    fragNormal = N;
}*/