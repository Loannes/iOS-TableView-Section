//
//  ViewController.m
//  testHeader
//
//  Created by dev_sinu on 2017. 3. 23..
//  Copyright © 2017년 com.example. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableDictionary *dic1 = [NSMutableDictionary dictionary];
    [dic1 setValue:@"03-20" forKey:@"date"];
    [dic1 setValue:@"소풍" forKey:@"title"];
    
    NSMutableDictionary *dic2 = [NSMutableDictionary dictionary];
    [dic2 setValue:@"03-20" forKey:@"date"];
    [dic2 setValue:@"회의" forKey:@"title"];
    
    NSMutableDictionary *dic3 = [NSMutableDictionary dictionary];
    [dic3 setValue:@"03-20" forKey:@"date"];
    [dic3 setValue:@"쇼핑" forKey:@"title"];

    NSMutableDictionary *dic4 = [NSMutableDictionary dictionary];
    [dic4 setValue:@"03-21" forKey:@"date"];
    [dic4 setValue:@"다이소 가기" forKey:@"title"];
    
    NSMutableDictionary *dic5 = [NSMutableDictionary dictionary];
    [dic5 setValue:@"03-21" forKey:@"date"];
    [dic5 setValue:@"구글 방문" forKey:@"title"];
    
    NSMutableDictionary *dic6 = [NSMutableDictionary dictionary];
    [dic6 setValue:@"03-21" forKey:@"date"];
    [dic6 setValue:@"스위프트 공부" forKey:@"title"];

    NSMutableDictionary *dic7 = [NSMutableDictionary dictionary];
    [dic7 setValue:@"03-22" forKey:@"date"];
    [dic7 setValue:@"라이브러리 리서치" forKey:@"title"];
    
    NSMutableDictionary *dic8 = [NSMutableDictionary dictionary];
    [dic8 setValue:@"03-22" forKey:@"date"];
    [dic8 setValue:@"곰스 주문하기" forKey:@"title"];
    
    NSArray *dicArr = [[NSArray alloc] initWithObjects: dic1, dic2, dic3, dic4, dic5, dic6, dic7, dic8, nil];
    
    fetchData = [self convertSectionTableData:dicArr keyString:@"date"];
}

- (NSMutableDictionary *)convertSectionTableData:(NSArray *)convertDataSet keyString:(NSString *)keyString {
    NSMutableDictionary *outputData = [NSMutableDictionary dictionary];
    NSMutableArray *temp = [NSMutableArray array];
    NSString *key = NULL;
    for (NSDictionary *dic in convertDataSet) {
        
        if (key == NULL) {
            key = [dic objectForKey:keyString];
        } else if (key != [dic objectForKey:keyString]) {
            [outputData setValue:temp forKey:key];
            temp = [NSMutableArray array];
            
            key = [dic objectForKey:keyString];
        }
        
        if ([[dic objectForKey:keyString] isEqualToString: key]) {
            [temp addObject:dic];
        }
        
        if (dic == [convertDataSet lastObject]) {
            [outputData setValue:temp forKey:key];
        }
    }
    
    return outputData;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[fetchData allValues][section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [fetchData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    int section = (int)indexPath.section;
    int row = (int)indexPath.row;
    
    NSDictionary *data = [[fetchData allValues][section] objectAtIndex:row];

    cell.textLabel.text = [data objectForKey:@"title"];

    return cell;
}


#pragma stuff I added
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [fetchData allKeys][section];
}



@end
