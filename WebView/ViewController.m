//
//  ViewController.m
//  WebView
//
//  Created by Admin on 27.01.19.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:self.url];
    
    [self.webView loadRequest:request];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)refreshButtons
{
    self.backButton.enabled = [self.webView canGoBack];
    self.forwardButton.enabled = [self.webView canGoForward];
}


#pragma mark - Actions

- (IBAction)backAction:(UIBarButtonItem *)sender
{
    if([self.webView canGoBack])
    {
        [self.webView stopLoading];
        [self.webView goBack];
    }
}

- (IBAction)forwardAction:(UIBarButtonItem *)sender
{
    if([self.webView canGoForward])
    {
        [self.webView stopLoading];
        [self.webView goForward];
    }
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.loadingIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.loadingIndicator stopAnimating];
    [self refreshButtons];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"%@", [error localizedDescription]);
    [self.loadingIndicator stopAnimating];
    [self refreshButtons];
}

@end
