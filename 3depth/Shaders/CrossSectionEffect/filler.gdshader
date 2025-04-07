shader_type spatial;
render_mode cull_disabled;
#include "func.gdshaderinc"

uniform mat4 fillplane;
uniform sampler2D _albedo: source_color;
uniform vec3 border_color: source_color;
uniform sampler2D normal_map: hint_normal;
uniform sampler2D s_noise;
varying vec3 wvtx;

void vertex(){
		wvtx = (MODEL_MATRIX * vec4(VERTEX,1.0)).xyz;
}
void fragment() {
	float dist =  fillDistance(-fillplane[1].xyz,fillplane[3].xyz,wvtx);

	if (dist < 0.0) discard;
	float border_dist = smoothstep(0.0, 0.0002, dist);
	float emission_border_dist = smoothstep(0.0, 0.02, dist);
	vec3 alb_color = texture(_albedo,UV).rgb;
	ALBEDO = (mix(border_color, texture(_albedo,UV).rgb, border_dist)).rgb;
	EMISSION = (mix(border_color * 7.0,vec3(0.0),border_dist)).rgb;
	SPECULAR = 0.4;
	ROUGHNESS = 0.5;
	METALLIC = 0.6;
	NORMAL_MAP = texture(normal_map,UV).rgb;
}
