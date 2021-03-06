//
//  Kitsunebi.metal
//  Kitsunebi_Metal
//
//  Created by Tomoya Hirano on 2018/07/19.
//

#include <metal_stdlib>
using namespace metal;

struct ColorInOut {
  float4 position [[ position ]];
  float2 texCoords;
};

vertex ColorInOut vertexShader(device float4 *position [[ buffer(0) ]],
                               device float2 *texCoords [[ buffer(1) ]],
                               uint    vid      [[ vertex_id ]]) {
  ColorInOut out;
  out.position = position[vid];
  out.texCoords = texCoords[vid];
  return out;
}

fragment float4 fragmentShader(ColorInOut in [[ stage_in ]],
                                            texture2d<float> texture1 [[ texture(0) ]],
                                            texture2d<float> texture2 [[ texture(1) ]]) {
  constexpr sampler colorSampler;
  float4 color1 = texture1.sample(colorSampler, in.texCoords);
  float4 color2 = texture2.sample(colorSampler, in.texCoords);
  return float4(color1.r, color1.g, color1.b, color2.r);
}
