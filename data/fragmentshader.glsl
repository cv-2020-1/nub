precision mediump float;

varying vec3 Normal, FragPos;

uniform vec3 lightPos;
uniform vec3 viewPos;
uniform vec3 lightPosB;
uniform vec3 lightPosC;
uniform vec3 lightPosD;
uniform vec3 lightPosE;
uniform vec3 lightPosF;
uniform vec3 lightPosG;
uniform vec3 lightPosH;

uniform vec3 lightColor;
uniform vec3 objectColor;
uniform vec3 shiny;
float shininess;

vec3 lightcolor(vec3 lightPos, vec3 viewPos, vec3 lightColor, vec3 objectColor, float shininess){
	// ambient
	float ambientStrength = 0.1;
	vec3 ambient = ambientStrength * lightColor;

	// diffuse 
	vec3 norm = normalize(Normal);
	vec3 lightDir = normalize(lightPos - FragPos);
	float diff = max(dot(norm, lightDir), 0.0);
	vec3 diffuse = diff * lightColor;

	// specular
	float specularStrength = 1.0;
	vec3 viewDir = normalize(viewPos - FragPos);
	vec3 reflectDir = reflect(-lightDir, norm);  
	float spec = pow(max(dot(viewDir, reflectDir), 0.0), shininess);
	vec3 specular = specularStrength * spec * lightColor;  
	
	vec3 result = (ambient + diffuse + specular) * objectColor;	
	return result;
}

void main() {
	shininess = shiny.x;

	vec3 first_color = lightcolor(lightPos, viewPos, lightColor, objectColor, shininess);
	vec3 two_color = lightcolor(lightPosB, viewPos, lightColor, objectColor, shininess);
	vec3 three_color = lightcolor(lightPosC, viewPos, lightColor, objectColor, shininess);
	vec3 four_color = lightcolor(lightPosD, viewPos, lightColor, objectColor, shininess);
	vec3 five_color = lightcolor(lightPosE, viewPos, lightColor, objectColor, shininess);
	vec3 six_color = lightcolor(lightPosF, viewPos, lightColor, objectColor, shininess);
	vec3 seven_color = lightcolor(lightPosG, viewPos, lightColor, objectColor, shininess);
	vec3 eight_color = lightcolor(lightPosH, viewPos, lightColor, objectColor, shininess);

	gl_FragColor = vec4(first_color + two_color + three_color + four_color + five_color + six_color + seven_color + eight_color, 1.0);
}