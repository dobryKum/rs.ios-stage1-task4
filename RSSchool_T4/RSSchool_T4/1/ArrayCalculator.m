#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    NSMutableArray *inputArray = [NSMutableArray arrayWithArray:array];
    NSMutableArray *positiveArray = [[NSMutableArray alloc] init];
    NSMutableArray *negativeArray = [[NSMutableArray alloc] init];
    NSInteger result = 1;
    for (int i = 0; i < [inputArray count]; i++) {
        if (![[inputArray objectAtIndex:i] isKindOfClass:[NSNumber class]]) {
            [inputArray removeObjectAtIndex:i];
            i--;
        } else {
            result *= [[inputArray objectAtIndex:i] intValue];
            if ([[inputArray objectAtIndex:i] intValue] < 0) {
                [negativeArray addObject:[inputArray objectAtIndex:i]];
            } else {
                [positiveArray addObject:[inputArray objectAtIndex:i]];
            }
        }
    }
    if ([inputArray count] == 0 || numberOfItems == 0) {
        return 0;
    }
    if (numberOfItems >= [inputArray count]) {
        return result;
    }
    
    [positiveArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj2 compare:obj1];
    }];
    [negativeArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    if ([positiveArray count] > numberOfItems) {
        [positiveArray removeObjectsInRange:NSMakeRange(numberOfItems, [positiveArray count]-numberOfItems)];
    }
    inputArray = [[[positiveArray reverseObjectEnumerator] allObjects] mutableCopy];
    if ([negativeArray count] > 1) {
        for (int i = 0; i < [negativeArray count] / 2; i++) {
            if ([[inputArray objectAtIndex:i] intValue] * [[inputArray objectAtIndex:i+1] intValue] <
                [[negativeArray objectAtIndex:i] intValue] * [[negativeArray objectAtIndex:i+1] intValue]) {
                [inputArray replaceObjectAtIndex:i withObject:[negativeArray objectAtIndex:i]];
                [inputArray replaceObjectAtIndex:i+1 withObject:[negativeArray objectAtIndex:i+1]];
            }
        }
    }
    result = 1;
    for (int i = 0; i < [inputArray count]; i++) {
        result *= [[inputArray objectAtIndex:i] intValue];
    }
    return result;
}
@end
