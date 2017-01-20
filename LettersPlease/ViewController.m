//
//  ViewController.m
//  LettersPlease
//
//  Created by Prayaas Jain on 6/28/16.
//  Copyright © 2016 Prayaas Jain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSArray *letters;
    NSString *result;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    letters = [NSArray arrayWithObjects:@"", @"", @"abc", @"def", @"ghi", @"jkl", @"mno", @"pqrs", @"tuv", @"wxyz", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)printNumWordsFor:(NSArray *)number andDigit:(int)d andOutput:(NSMutableArray *)output {

    if(d == [number count]) {
        result = [[output valueForKey:@"description"] componentsJoinedByString:@""];
        NSLog(@"%@ ", result);
        return;
    }

    for (int i=0; i<[[letters objectAtIndex:[[number objectAtIndex:d] intValue]] length]; i++) {
        [output replaceObjectAtIndex:d withObject:[NSString stringWithFormat:@"%c", [[letters objectAtIndex:[[number objectAtIndex:d] intValue]] characterAtIndex:i]]];
        [self printNumWordsFor:number andDigit:d+1 andOutput:output];

        if([[number objectAtIndex:d] intValue] == 0 || [[number objectAtIndex:d] intValue] == 1)
            return;
    }

}

- (NSArray *)getDigitsFromInt:(int)num withLength:(int)l {

    NSMutableArray *arr = [NSMutableArray new];
    for(int i=1; i<=l; i++) {
        [arr addObject:[NSNumber numberWithInt:num/(pow(10,(l-i)))]];
        num = (int)num % (int)(pow(10,(l-i)));
    }
    return arr;
}

- (IBAction)computeButtonPressed:(id)sender {

    NSString *num = [self.numberField text];
    NSArray *number = [self getDigitsFromInt:[num intValue] withLength:[num length]];
    NSMutableArray *output = [[NSMutableArray alloc] initWithCapacity:[number count]];
    for(int i=0; i<[number count]; i++) {
        [output addObject:[NSNull null]];
    }

    [self printNumWordsFor:number andDigit:0 andOutput:output];
}

@end
