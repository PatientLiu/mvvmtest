//
//  ViewController.m
//  testPL
//
//  Created by 刘璞峰 on 15/11/5.
//  Copyright © 2015年 patient. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"
#import "Jsondata.h"
#import "ReactiveCocoa.h"
#import "AppDelegate.h"
@interface network : networktest

@end
@implementation network
-(id)init
{
    self = [super init];
    if (self) {
        self.url = @"HPImageArchive.aspx?format=js&idx=0&n=1";
    }
    return self;
}
-(Class)dataClass
{
    return [Jsondata class];
}

@end


@interface ViewController ()
{
    IBOutlet UIImageView *imageBG;
}
@property (nonatomic,strong) network *ViewModel;
@property (nonatomic,strong) Jsondata *model;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _ViewModel = [network new];
    [self.ViewModel loadData];
    @weakify(self)

    [RACObserve(_ViewModel,states) subscribeNext:^(id x) {
        @strongify(self)
        if (self.ViewModel.states == ViewModelDataStateDone) {
            self.model = self.ViewModel.datas[0];
            if (!self.model.url) {return;}
            [self setimagebg];
        } else if (self.ViewModel.states == ViewModelDataStateError) {
            NSLog(@"%@",[self.ViewModel.error userInfo][@"message"]);
        }
    }];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)setimagebg
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    __block UIImage *imagebg = nil;
    dispatch_group_async(group, queue, ^{
        NSLog(@"action One");
        NSString *url = [self.model.url stringByReplacingOccurrencesOfString:BiYingapi withString:@""];
        imagebg = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[BiYingapi stringByAppendingString:url]]]];
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"action Two");
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"action Complete");
        imageBG.image = imagebg;
    });
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
