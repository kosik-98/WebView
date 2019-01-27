//
//  ViewController.h
//  WebView
//
//  Created by Admin on 27.01.19.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) NSURL* url;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardButton;

- (IBAction)backAction:(UIBarButtonItem *)sender;
- (IBAction)forwardAction:(UIBarButtonItem *)sender;

@end

