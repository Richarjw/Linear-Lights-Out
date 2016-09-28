//
//  LinearLightsOutGame.h
//  LinearLightsOut
//
//  Created by Tracy Richard on 6/29/16.
//  Copyright © 2016 Jack Richard. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MAX_NUM_LIGHTS 100
@interface LinearLightsOutGame : NSObject {

    BOOL lightStates[MAX_NUM_LIGHTS];
}
@property (nonatomic) NSInteger moves;
@property (nonatomic) NSInteger lights;
-(id)initWithNumLights: (NSInteger) numLights;
-(BOOL) pressedLightAtIndex: (NSInteger) index;
-(NSString*) getLightStates;
-(BOOL) getCurrentLightState: (NSInteger) index;
@end
