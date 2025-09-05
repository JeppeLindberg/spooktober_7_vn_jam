// Blends two noise textures to create a layer of animated shadows over the game world.
// Expects the first noise to be assigned to the node's Texture property,
// and the second noise texture is the noise_texture2 uniform.
shader_type canvas_item;
render_mode blend_mix;

uniform vec4 tint : source_color = vec4(0.0);
uniform sampler2D sprite : hint_default_black;
uniform sampler2D mult : hint_default_black;

vec4 multiply(vec4 base, vec4 blend){
	return base * blend;
}

vec4 lighten(vec4 base, vec4 blend){
	return max(base, blend);
}

vec4 screen(vec4 base, vec4 blend){
	return 1.0 - (1.0 - base) * (1.0 - blend);
}
vec4 soft_light(vec4 base, vec4 blend){
	vec4 limit = step(0.5, blend);
	return mix(2.0 * base * blend + base * base * (1.0 - 2.0 * blend), sqrt(base) * (2.0 * blend - 1.0) + (2.0 * base) * (1.0 - blend), limit);
}


void fragment() {
	
	vec4 sprite_texture = texture(sprite, UV);

	vec4 mult_texture = texture(mult, SCREEN_UV);

	vec4 result = soft_light(sprite_texture, mult_texture);
	COLOR = vec4(result.rgb, sprite_texture.a);
}


