//
//  BRGetAccountCommand.h
//  BitBot
//
//  Created by Deszip on 07/07/2018.
//  Copyright © 2018 BitBot. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BRCommand.h"
#import "BRSyncEngine.h"
//#import "BRBitriseAPI.h"
//#import "BRStorage.h"

NS_ASSUME_NONNULL_BEGIN

@interface BRGetAccountCommand : BRCommand

//- (instancetype)initWithAPI:(BRBitriseAPI *)api storage:(BRStorage *)storage token:(NSString *)token;
- (instancetype)initWithSyncEngine:(BRSyncEngine *)engine token:(NSString *)token;

@end

NS_ASSUME_NONNULL_END
