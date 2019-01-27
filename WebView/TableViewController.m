//
//  TableViewController.m
//  WebView
//
//  Created by Admin on 27.01.19.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"

@interface TableViewController ()

@property (strong, nonatomic) NSArray* linksArray;
@property (strong, nonatomic) NSArray* filesArray;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.linksArray = @[@"https://vk.com",@"https://youtube.com"];
    self.filesArray = @[@"1.pdf",@"2.pdf"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return @"Links";
    else
        return @"Files";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
        return [self.linksArray count];
    else
        return [self.filesArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(indexPath.section == 0)
    {
        cell.textLabel.text = [self.linksArray objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text = [self.filesArray objectAtIndex:indexPath.row];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    if(indexPath.section == 0)
    {
        vc.url = [NSURL URLWithString:[self.linksArray objectAtIndex:indexPath.row]];
    }
    else
    {
        NSString* path = [[NSBundle mainBundle] pathForResource:[self.filesArray objectAtIndex:indexPath.row] ofType:nil];
        
        vc.url = [NSURL fileURLWithPath:path];
    }
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
