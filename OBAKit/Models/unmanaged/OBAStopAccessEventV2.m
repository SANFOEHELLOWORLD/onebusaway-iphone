/**
 * Copyright (C) 2009-2016 bdferris <bdferris@onebusaway.org>, University of Washington
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <OBAKit/OBAStopAccessEventV2.h>

@implementation OBAStopAccessEventV2

#pragma mark - NSCoder Methods

- (id)initWithCoder:(NSCoder*)coder {
    self = [super init];
    if (self) {
        _title = [coder decodeObjectForKey:@"title"];
        _subtitle = [coder decodeObjectForKey:@"subtitle"];
        _stopIds = [coder decodeObjectForKey:@"stopIds"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder*)coder {
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.subtitle forKey:@"subtitle"];
    [coder encodeObject:self.stopIds forKey:@"stopIds"];
}

#pragma mark - Equality

- (BOOL)isEqual:(OBAStopAccessEventV2*)object {
    if (self == object) {
        return YES;
    }

    if (![object isKindOfClass:self.class]) {
        return NO;
    }

    return self.hash == object.hash;
}

- (NSUInteger)hash {
    return [NSString stringWithFormat:@"%@_%@_%@", self.title, self.subtitle, [self.stopIds componentsJoinedByString:@"_"]].hash;
}

@end
