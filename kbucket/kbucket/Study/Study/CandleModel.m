//
//  CandleModel.m
//  Study
//
//  Created by 김미혜 on 2018. 9. 18..
//  Copyright © 2018년 kikiplus. All rights reserved.
//

#import "CandleModel.h"

@interface CandleModel(){
    __weak UIImage *tempWeak;
}
@end

@implementation CandleModel


- (instancetype) init{
    
    self = [super init];
    
    if(self){
        _imageCandleOn = [UIImage imageNamed:@"on.jpg"];
        _imageCandleOff = [UIImage imageNamed:@"off.jpg"];
        
        __strong UIImage *temp = [[UIImage alloc] init];
        tempWeak = temp;

        NSLog(@"%@", tempWeak);
    }
    NSLog(@"%@", tempWeak);
    return self;
}

//- (UIImage*) imageCandleOn{
//    return imageCandleOn;
//}
//- (void) setImageCandleOn:(UIImage*)newImage{
//    imageCandleOn = newImage;
//}

//- (UIImage*) imageCandleOff{
//    return imageCandleOff;
//}
//- (void) setImageCandleOff:(UIImage*)newImage{
//    imageCandleOff = newImage;
//}

//- (BOOL) nowStatus{
//    return nowStatus;
//}
//- (void)setNowStatus:(BOOL)newStatus{
//    nowStatus = newStatus;
//}

- (NSString *)stringNowStatus{
    NSString *rValue = NULL;
    if(rValue == false){
        rValue = @"Candle is now off";
    }else{
        rValue = @"Candle is now on";
    }
    return rValue;
}

@end
