#version 330
in vec2 texcoord;
uniform sampler2D tex;
out vec4 color;

void main() {
    vec4 c = texture(tex, texcoord);
    float gray = dot(c.rgb, vec3(0.299, 0.587, 0.114));
    color = vec4(gray, gray, gray, c.a);
}
