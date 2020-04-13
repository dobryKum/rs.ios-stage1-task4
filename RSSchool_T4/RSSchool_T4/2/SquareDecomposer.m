#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    NSNumber *remain = [NSNumber numberWithLongLong:[number longLongValue] * [number longLongValue]];
    NSMutableArray *result = [self decomposerOfNumber:number withRemain:remain];
    return [result isEqual:nil] ? nil : [result subarrayWithRange:NSMakeRange(0, [result count] - 1)];
}

- (NSMutableArray*)decomposerOfNumber:(NSNumber*)number withRemain:(NSNumber*)remain {
    if ([remain longLongValue] == 0) {
        return [NSMutableArray arrayWithObject:number];
    }
    for (long long i = [number intValue] - 1; i > 0; i--) {
        if ([remain longLongValue] - i * i >= 0) {
            long long nextRemain = [remain longLongValue] - i * i;
            NSMutableArray *resultArray = [self decomposerOfNumber:[NSNumber numberWithLongLong:i]
                                                        withRemain:[NSNumber numberWithLongLong:nextRemain]];
            if (resultArray) {
                [resultArray addObject:number];
                return resultArray;
            }
        }
    }
    return nil;
}
@end
