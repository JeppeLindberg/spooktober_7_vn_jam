shader_type canvas_item;

uniform vec4 top_color : source_color = vec4(1.0);
uniform vec4 bottom_color : source_color = vec4(1.0);

void fragment() {
	
    COLOR = vec4(UV.x, UV.y, 0.5, 1.0);
}