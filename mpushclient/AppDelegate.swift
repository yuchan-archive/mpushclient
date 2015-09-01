//
//  AppDelegate.swift
//  mpushclient
//
//  Created by Ohashi Yusuke on 8/29/15.
//  Copyright © 2015 Ohashi Yusuke. All rights reserved.
//

import UIKit

let MPushNotificationDidReceiveAPNS:String = "MPushNotiifcationDidReceiveAPNS"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var remoteNotificationInfo: NSDictionary?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let types: UIUserNotificationType = [UIUserNotificationType.Badge, UIUserNotificationType.Sound, UIUserNotificationType.Alert]
        let mySettings: UIUserNotificationSettings = UIUserNotificationSettings(forTypes: types, categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(mySettings)
        application.registerForRemoteNotifications()
        
        if let options = launchOptions {
            if options[UIApplicationLaunchOptionsRemoteNotificationKey] != nil {
                let info:NSDictionary = options[UIApplicationLaunchOptionsRemoteNotificationKey] as! NSDictionary
                self.remoteNotificationInfo = info
            }
        }
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        if (self.remoteNotificationInfo != nil) {
            NSNotificationCenter.defaultCenter().postNotificationName(MPushNotificationDidReceiveAPNS, object: self.remoteNotificationInfo)
            self.remoteNotificationInfo = nil
        }
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        NSNotificationCenter.defaultCenter().postNotificationName(MPushNotificationDidReceiveAPNS, object: userInfo)
        HBOLogger.Debug("\(userInfo)")
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        let characterSet: NSCharacterSet = NSCharacterSet( charactersInString: "<>" )
        
        let deviceTokenString: String = ( deviceToken.description as NSString )
            .stringByTrimmingCharactersInSet( characterSet )
            .stringByReplacingOccurrencesOfString( " ", withString: "" ) as String
        
        HBOLogger.Debug(deviceTokenString)
    }

}

