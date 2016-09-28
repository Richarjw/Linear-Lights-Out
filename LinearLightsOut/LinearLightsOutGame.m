//
//  LinearLightsOutGame.m
//  LinearLightsOut
//
//  Created by Tracy Richard on 6/29/16.
//  Copyright © 2016 Jack Richard. All rights reserved.
//

#import "LinearLightsOutGame.h"

@implementation LinearLightsOutGame
-(id) initWithNumLights:(NSInteger)numLights {
    self = [super init];
    if (self) {
        for (int i = 0; i < numLights; i+=1) {
            int rand = arc4random_uniform(2);
            if (rand == 0)
                lightStates[i] = false;
            else
                lightStates[i] = true;
        }
        self.moves = 0;
        self.lights = numLights;
    }
    return self;
}
-(NSString*) getLightStates {
    NSMutableString* current= [[NSMutableString alloc] init];
    for (int i = 0; i < self.lights; i+=1) {
        if (lightStates[i] == true)
            [current appendString:@"1"];
        else
            [current appendString:@"0"];
    }
    
    return current;
}
-(BOOL) getCurrentLightState: (NSInteger) index {
    return lightStates[index];
}
-(BOOL) pressedLightAtIndex:(NSInteger)index {

    if (index == 0) {
        lightStates[index] = !lightStates[index];
        lightStates[index+1] = !lightStates[index+1];
    } else if (index == self.lights - 1) {
        lightStates[index] = !lightStates[index];
        lightStates[index-1] = !lightStates[index-1];
    } else {
        lightStates[index] = !lightStates[index];
        lightStates[index+1] = !lightStates[index+1];
        lightStates[index-1] = !lightStates[index-1];
    }
    self.moves+=1;
    for (int i = 0; i < self.lights; i+=1) {
        if (lightStates[i] == true) {
            return false;
        }
    }
    return true;
}

@end
