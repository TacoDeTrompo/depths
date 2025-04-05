shader_type spatial;
render_mode unshaded, cull_front;
#include "func.gdshaderinc"

uniform vec3 color: source_color;
uniform sampler2D s_noise;
varying vec3 wvtx;
uniform mat4 fillplane;
void vertex(){
	wvtx = (MODEL_MATRIX * vec4(VERTEX,1.0)).xyz;
}

void fragment() {
	float dist =  fillDistance(-fillplane[1].xyz,fillplane[3].xyz,wvtx);
	if (dist < 0.0) discard;
	ALBEDO = color;
}