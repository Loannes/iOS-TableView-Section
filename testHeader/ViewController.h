//
//  ViewController.h
//  testHeader
//
//  Created by dev_sinu on 2017. 3. 23..
//  Copyright © 2017년 com.example. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSMutableDictionary *fetchData;
}

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

