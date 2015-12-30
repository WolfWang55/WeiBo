//
//  HomeTableViewController.m
//  Weibo
//
//  Created by LG on 15/12/29.
//  Copyright (c) 2015年 LG. All rights reserved.
//

#import "HomeTableViewController.h"
#import "UIBarButtonItem+Util.h"
#import "TitleButton.h"
#import "DropControl.h"

@interface HomeTableViewController ()

@property(nonatomic,strong)UIControl *dropControl;

@end

@implementation HomeTableViewController

-(UIControl *)dropControl
{
    if(_dropControl==nil)
    {
        _dropControl = [UIControl alloc]
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNaviBarItem];
    
}

/**
 *  构建导航栏
 */
-(void)createNaviBarItem
{
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem generateBarButtonItemWithNormalImageName:@"navigationbar_icon_radar" highlightedImageName:@"navigationbar_icon_radar_highlighted"];
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem generateBarButtonItemWithNormalImageName:@"navigationbar_friendattention" highlightedImageName:@"navigationbar_friendattention_highlighted"];
    
    TitleButton *titlebutton=[TitleButton buttonWithType:UIButtonTypeCustom];
    [titlebutton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titlebutton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    titlebutton.frame=CGRectMake(0, 0, 200, 30);
    [titlebutton setTitle:@"来自蒙塔基的罡蛋" forState:UIControlStateNormal];
    [titlebutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.navigationItem.titleView=titlebutton;
    [titlebutton addTarget:self action:@selector(titlebuttonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)titlebuttonPressed:(TitleButton *)button
{
    button.selected=!button.selected;
    
    if(button.selected)
    {
        
    }
    else
    {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
