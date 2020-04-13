#import "FullBinaryTrees.h"
#import "TreeNode.h"

@interface FullBinaryTrees ()

@property (nonatomic, strong) NSMutableArray *treeArray;
@property (nonatomic, strong) NSMutableString *treeString;
@property (nonatomic, strong) NSMutableString *result;

@end

@implementation FullBinaryTrees
- (NSString *)stringForNodeCount:(NSInteger)count {
    if (count % 2 == 0)
        return @"[]";
    if (count == 1)
        return @"[[0]]";
    
    NSMutableArray *arrayOfTrees = [self generateArrayOfTreesForNodeCount:count];
    self.result = [[NSMutableString alloc] initWithString:@"["];
    
    for (TreeNode *node in arrayOfTrees) {
        self.treeArray = [[NSMutableArray alloc] init];
        [self levelOrderTraversal:node];
        while ([[self.treeArray lastObject] isEqual:@"null"]) {
            [self.treeArray removeLastObject];
        }
        self.treeString = [NSMutableString stringWithString:@"["];
        [self.treeArray enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.treeString appendString:[NSString stringWithFormat:@"%@,", obj]];
        }];
        [self.treeString replaceCharactersInRange:NSMakeRange([self.treeString length] - 1, 1) withString:@"]"];
        [self.result appendFormat:@"%@,", self.treeString];
    }
    [self.result replaceCharactersInRange:NSMakeRange([self.result length]-1, 1) withString:@"]"];
    return self.result;
}

- (NSMutableArray<TreeNode*>*)generateArrayOfTreesForNodeCount:(NSInteger)count {
    NSMutableArray *arrayOfTrees = [[NSMutableArray alloc] init];
    if (count == 1) {
        [arrayOfTrees addObject:[[TreeNode alloc] init]];
        return arrayOfTrees;
    }
    for (int i = 1; i <= count - 1; i+=2) {
        NSMutableArray *leftBranch = [self generateArrayOfTreesForNodeCount:i];
        NSMutableArray *rightBranch = [self generateArrayOfTreesForNodeCount:count-i-1];
        for (TreeNode *l in leftBranch) {
            for (TreeNode *r in rightBranch) {
                TreeNode *temp = [[TreeNode alloc] init];
                [temp setLeft:l];
                [temp setRight:r];
                [arrayOfTrees addObject:temp];
            }
        }
    }
    return [arrayOfTrees mutableCopy];
}

- (BOOL)getLevel:(TreeNode *)root and:(NSUInteger)level {
    if(root == nil)
        return NO;

    if(level == 1) {
        [self.treeArray addObject:root.value];
        return YES;
    }
    
    bool left = [self getLevel:root.left and:level - 1];
    bool right = [self getLevel:root.right and:level - 1];
    
    return left || right;
}

- (void)levelOrderTraversal:(TreeNode *)root {
    NSUInteger level = 1;
    while([self getLevel:root and:level++]);
}
@end
