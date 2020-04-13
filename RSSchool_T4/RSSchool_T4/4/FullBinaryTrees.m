#import "FullBinaryTrees.h"

@interface FullBinaryTrees ()
@property(nonatomic, strong) NSMutableArray<NSMutableArray*> *array;
@end

@implementation FullBinaryTrees
- (NSString *)stringForNodeCount:(NSInteger)count {
    if (count % 2 == 0)
        return @"[]";
    if (count == 1)
        return @"[[0]]";
    
    
    return @"";
}
@end
