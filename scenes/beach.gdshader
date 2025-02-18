shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;
uniform vec2 mouse_pos;
uniform float radius : hint_range(10.0, 500.0) = 150.0;

void fragment() {
    vec2 uv = SCREEN_UV;
    float dist = distance(uv, mouse_pos);

    // Create a smooth circular gradient for the spotlight effect
    float alpha = smoothstep(radius / 512.0, (radius - 20.0) / 512.0, dist);

    vec4 screen_color = texture(screen_texture, uv);

    // Invert the blending to reveal the background correctly
    COLOR = mix(vec4(0.0, 0.0, 0.0, 1.0), screen_color, alpha);
}
