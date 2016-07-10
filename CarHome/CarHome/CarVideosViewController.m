//
//  CarVideosViewController.m
//  CarHome
//
//  Created by Tengfei on 16/7/9.
//  Copyright © 2016年 tengfei. All rights reserved.
//

#import "CarVideosViewController.h"
#import "CarVideoCell.h"

@interface CarVideosViewController ()<UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIWebView *webView;


@property (nonatomic,strong)NSMutableArray * dataArray;

@end

@implementation CarVideosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://v.autohome.com.cn/v-82408.html"]];
    self.webView.delegate = self;
    [self.webView loadRequest:request];
}


-(void)webViewDidFinishLoad:(UIWebView *)webView
{
 
    
    //    <html>123</html>
    //    innerHTML  123
    //    outerHTML    <html>123</html>
    
    //    NSString *str = @"document.getElementsByTagName('html')[0].outerHTML";
    //    NSString *html = [webView stringByEvaluatingJavaScriptFromString:str];
    //    NSLog(@"--html:%@",html);
    
    NSMutableString *js = [NSMutableString string];
    
    [js appendString:@"document.getElementsByClassName(\"application\").remove;"];
    
    //删除header
    [js appendString:@"var headers = document.getElementsByTagName('data-gr-c-s-loaded')"];
    [js appendString:@"for (var i = 0; i < headers.length; i++) { header = headers[i];header.remove();  };"];
//    ""
    //删除购买
    [js appendString:@"var top = document.getElementsByClassName('cost-box')[0];"];
    [js appendString:@"top.parentNode.removeChild(top);"];
    
    //删除header
    [js appendString:@"var bottom = document.getElementsByClassName('buy-now')[0];"];
    [js appendString:@"bottom.parentNode.removeChild(bottom);"];
    
    [webView stringByEvaluatingJavaScriptFromString:js];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CarVideoCell *cell = [CarVideoCell cellWithTableView:tableView];
    
    return cell;
}



-(NSMutableArray *)dataArray
{
    if(!_dataArray){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
