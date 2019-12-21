//
//  NSBezierPathChatBubble.h
//  HQHUtils
//
//  Created by quanhao huang on 2019/12/21.
//  Copyright © 2019 quanhao huang. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_OS_OSX

@interface NSBezierPathChatBubble : NSObject

+ (NSBezierPath *)makeBubble:(NSBezierPath *) bezierPath withBubbleRect:(NSRect)rect corner:(CGFloat)corner atPostion:(NSInteger)pos;

@end

#endif
