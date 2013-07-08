#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D sampler;
uniform highp float dt;
uniform highp float angle;
uniform highp float da;

varying vec2 texcoord;

void main(void)
{
    //gl_FragColor = texelFetch(sampler, gl_FragCoord.st, 0);
    vec2 point = texcoord - vec2(0.5, 0.5);
    float a = asin(point.y / length(point));
    if (abs(a - radians(angle)) < 0.01)
        gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
    else {
        vec3 color = texture2D(sampler, texcoord).xyz - dt * 0.01;
        if (any(lessThan(color, vec3(0.0, 0.0, 0.0))))
            gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);
        else
            gl_FragColor = vec4(color, 1.0);
    }
}
