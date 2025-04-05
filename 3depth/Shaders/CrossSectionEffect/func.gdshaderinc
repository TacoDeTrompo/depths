float cutDistance(vec3 planeNormal, vec3 planePos, vec3 worldvertex, sampler2D s_noise){
	float planeDistance = dot(planeNormal,planePos);
	float vertexDistance = dot(planeNormal,worldvertex);
	float dist = vertexDistance - planeDistance;
	vec2 uv = worldvertex.xy/5.0;
	uv += TIME * 0.05;
	float noise = texture(s_noise,uv ).r;
	dist +=noise*0.02;
	return dist;
}

float fillDistance(vec3 planeNormal, vec3 planePos, vec3 worldvertex){
	float planeDistance = dot(planeNormal,planePos);
	float vertexDistance = dot(planeNormal,worldvertex);
	float dist = vertexDistance - planeDistance;
	return dist;
}
