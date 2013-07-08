attribute lowp vec3 vertexIn;
attribute lowp vec2 texcoordIn;

varying vec2 texcoord;

void main(void)
{
    texcoord = texcoordIn;
    gl_Position = vec4(vertexIn, 1);
}
