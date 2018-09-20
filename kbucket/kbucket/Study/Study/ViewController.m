//
//  ViewController.m
//  Study
//
//  Created by 김미혜 on 2018. 9. 18..
//  Copyright © 2018년 kikiplus. All rights reserved.
//

#import "ViewController.h"
#import "CandleModel.h"

#define SWITCHUPPER 1
#define SWITCHDOWN  2


@interface ViewController ()
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//     [lableStatus setText:@"Candle is now on!!!"];
//     [switchNow setOn:true];
//    [viewIamge setImage:[UIImage imageNamed:@"off.jpg"]];

    modelCandle = [[CandleModel alloc] init];
    [switchNow setOn:false];
    [self touchSwitch:switchNow];
}
- (IBAction)touchSwitch:(id)sender {
//    NSInteger t = [sender tag];
//    switch (t) {
//        case SWITCHUPPER:
//            NSLog(@" 위 스위치");
//            break;
//        case SWITCHDOWN:
//            NSLog(@" 아래 스위치");
//            break;
//        default:
//            break;
//    }
    
    BOOL nowStatus = [sender isOn];
    [modelCandle setNowStatus:nowStatus];
    if(nowStatus == true){
        [viewIamge setImage:[modelCandle imageCandleOn]];
    }else{
        [viewIamge setImage:[modelCandle imageCandleOff]];
    }
    [lableStatus setText:[modelCandle stringNowStatus]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
