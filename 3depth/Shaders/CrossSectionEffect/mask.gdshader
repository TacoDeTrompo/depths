shader_type spatial;
render_mode unshaded;
uniform sampler2D screen_tex: hint_screen_texture, filter_linear_mipmap, repeat_disable;
uniform vec3 mask_color: source_color;

uniform sampler2D _albedo: source_color;
uniform bool use_texture = false;

void fragment() {
	vec3 buffer = texture(screen_tex,SCREEN_UV).rgb;
	float rgb_dist = distance(mask_color,buffer);
	rgb_dist = step(0.01,rgb_dist);
	if (use_texture) {
		ALBEDO = texture(_albedo,UV).rgb;
	}
	else {
		vec2 uv = UV;
		uv.y -= TIME * 0.1;
		float pattern = sin(uv.y*20.0 * TAU);
		pattern = step(0.5,pattern);
		ALBEDO = vec3(pattern);
	}
	ALPHA = 1.0 - rgb_dist;


}
