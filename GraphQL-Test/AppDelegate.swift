//
//  AppDelegate.swift
//  GraphQL-Test
//
//  Created by Bruce Rick on 2019-07-23.
//  Copyright © 2019 Bruce Rick. All rights reserved.
//

import UIKit
import Apollo

let apollo = ApolloClient(url: URL(string: "https://api.graphql.jobs")!)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        apollo.cacheKeyForObject = { $0["id"] }
        return true
    }
}

