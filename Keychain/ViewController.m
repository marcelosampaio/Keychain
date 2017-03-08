//
//  ViewController.m
//  Keychain
//
//  Created by Marcelo Sampaio on 3/8/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

#import "ViewController.h"
#import "FDKeychain.h"

#define KEYCHAIN_KEY        @"StoredKeychainData"
#define KEYCHAIN_SERVICE    @"KeychainService"

@interface ViewController ()

@end

@implementation ViewController


#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    
}


#pragma mark - UI Actions
- (IBAction)storeKeyChain:(id)sender {
    // store some value in keychain

    NSString *keychainData = @"UUID of the device";
    NSError *error = nil;
    
    [FDKeychain saveItem: keychainData
                  forKey: KEYCHAIN_KEY
              forService: KEYCHAIN_SERVICE
                   error: &error];
    
    NSLog(@"*** KEYCHAIN has been store");
    
}

- (IBAction)getKeyChain:(id)sender {
    
    NSError *error = nil;
    
    NSString *keychainData = [FDKeychain itemForKey: KEYCHAIN_KEY
                                     forService: KEYCHAIN_SERVICE
                                          error: &error];
    
    NSLog(@"** keychain data retrieved: %@",keychainData);
    
    
    
}

- (IBAction)deleteKeyChain:(id)sender {
    
    NSError *error = nil;
    
    [FDKeychain deleteItemForKey: KEYCHAIN_KEY
                      forService: KEYCHAIN_SERVICE
                           error: &error];
    
    
    NSLog(@"keychain deleted");
    
    
}




@end
