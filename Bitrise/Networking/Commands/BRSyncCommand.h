//
//  BRSyncCommand.h
//  BitBot
//
//  Created by Deszip on 07/07/2018.
//  Copyright © 2018 BitBot. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BRCommand.h"
#import "BRSyncEngine.h"
#import "BREnvironment.h"

NS_ASSUME_NONNULL_BEGIN

@interface BRSyncCommand : BRCommand

- (instancetype)initSyncEngine:(BRSyncEngine *)engine environment:(BREnvironment *)environment;

@end

NS_ASSUME_NONNULL_END
