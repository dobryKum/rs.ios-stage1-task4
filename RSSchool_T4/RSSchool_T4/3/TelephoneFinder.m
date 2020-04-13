#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ([number rangeOfCharacterFromSet:notDigits].location != NSNotFound)
        return nil;
    NSMutableString *num = [[NSMutableString alloc] initWithString:number];
    NSMutableArray<NSString*> *answer = [NSMutableArray new];
    NSDictionary *numbersDictionary = @{
        @"0":@"8",
        @"1":@"24",
        @"2":@"135",
        @"3":@"26",
        @"4":@"157",
        @"5":@"2468",
        @"6":@"359",
        @"7":@"48",
        @"8":@"7590",
        @"9":@"68"
    };
    for (int i = 0;i < [num length]; i++) {
        NSString *digit = [NSString stringWithFormat:@"%c", [num characterAtIndex:i]];
        NSString *replace = [numbersDictionary valueForKey:digit];
        for (int j = 0; j < [replace length]; j++) {
            [num replaceCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithFormat:@"%c", [replace characterAtIndex:j]]];
            [answer addObject:[num mutableCopy]];
        }
        num = [number mutableCopy];
    }
    return answer;
}
@end
