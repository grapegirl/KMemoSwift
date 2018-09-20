//
//  HRModel.m
//  Study
//
//  Created by 김미혜 on 2018. 9. 19..
//  Copyright © 2018년 kikiplus. All rights reserved.
//

#import "HRModel.h"

@implementation HRModel

- (instancetype) init{
    self = [super init];
    
    if(self){
        _arrayList = [NSMutableArray array];
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"GirsDays",@"name", @"idol", @"job", nil];
        [_arrayList addObject:dic];
        dic = [NSDictionary dictionaryWithObjectsAndKeys:@"Mr bin",@"name", @"Comedian", @"job", nil];
        [_arrayList addObject:dic];
        dic = [NSDictionary dictionaryWithObjectsAndKeys:@"Bill",@"name", @"Business Man", @"job", nil];
        [_arrayList addObject:dic];
        dic = [NSDictionary dictionaryWithObjectsAndKeys:@"Suji",@"name", @"Singer", @"job", nil];
        [_arrayList addObject:dic];
    }
    return self;
}
@end
