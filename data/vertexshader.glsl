attribute vec3 aPosition;
attribute vec3 aNormal;
attribute vec3 aVertexPosition;
attribute vec3 aVertexNormal;
attribute vec4 position;
uniform mat4 transform;
uniform mat4 uProjectionMatrix;
uniform mat4 uModelViewMatrix;
uniform mat3 uNormalMatrix;
uniform mat3 normalMatrix;
attribute vec3 normal;
uniform mat4 modelview;

varying vec3 Normal, FragPos;

void main() {
  vec4 positionVec4 = vec4(aPosition, 1.0);
  //gl_Position = uProjectionMatrix * uModelViewMatrix * positionVec4;
  gl_Position = transform * position;    

  vec3 surfaceVertexNormal = normalMatrix * normal; 
  vec3 eyePosition = vec3(modelview * position);

  Normal = surfaceVertexNormal;
  FragPos = eyePosition;
}