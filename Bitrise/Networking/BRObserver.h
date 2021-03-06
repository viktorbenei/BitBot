//
//  BRObserver.h
//  BitBot
//
//  Created by Deszip on 13/07/2018.
//  Copyright © 2018 BitBot. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BRCommand.h"
#import "BRBitriseAPI.h"

NS_ASSUME_NONNULL_BEGIN

@interface BRObserver : NSObject

- (void)startObserving:(BRCommand *)command;
- (void)stopObserving;

@end

NS_ASSUME_NONNULL_END
