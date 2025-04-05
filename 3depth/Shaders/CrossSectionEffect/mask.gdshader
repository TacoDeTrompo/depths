shader_type spatial;
render_mode unshaded;

// Screen buffer
uniform sampler2D screen_tex : hint_screen_texture, filter_linear_mipmap, repeat_disable;

// Mask colors
uniform vec3 mask_color_1 : source_color;
uniform vec3 mask_color_2 : source_color;
uniform vec3 mask_color_3 : source_color;

// Multiple textures
uniform sampler2D tex_1 : source_color;
uniform sampler2D tex_2 : source_color;
uniform sampler2D tex_3 : source_color;

// Use pattern instead of textures
uniform bool use_texture = false;

const float THRESHOLD = 0.000001;

void fragment() {
	vec3 buffer = texture(screen_tex, SCREEN_UV).rgb;

	// Distance comparisons
	float dist1 = distance(mask_color_1, buffer);
	float dist2 = distance(mask_color_2, buffer);
	float dist3 = distance(mask_color_3, buffer);

	vec3 final_color = vec3(0.0);
	bool matched = false;

	if (dist1 < THRESHOLD) {
		final_color = texture(tex_1, UV).rgb;
		matched = true;
	} else if (dist2 < THRESHOLD) {
		final_color = texture(tex_2, UV).rgb;
		matched = true;
	} else if (dist3 < THRESHOLD) {
		final_color = texture(tex_3, UV).rgb;
		matched = true;
	}

	if (!matched) {
		if (use_texture) {
			final_color = texture(tex_1, UV).rgb; // fallback texture
		} else {
			vec2 uv = UV;
			uv.y -= TIME * 0.1;
			float pattern = sin(uv.y * 20.0 * TAU);
			pattern = step(0.5, pattern);
			final_color = vec3(pattern);
		}
	}

	ALBEDO = final_color;
	ALPHA = matched ? 1.0 : 0.0;
}
