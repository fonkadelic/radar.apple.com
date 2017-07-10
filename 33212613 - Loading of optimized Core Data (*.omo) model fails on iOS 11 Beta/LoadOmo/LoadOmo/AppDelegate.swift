//
//  AppDelegate.swift
//  LoadOmo
//
//  Created by Bernhard Loibl on 10.07.17.
//  Copyright © 2017 Bernhard Loibl. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let modelBundle = Bundle.main
        guard let url = modelBundle.url(forResource: "LoadOmo", withExtension: "omo", subdirectory: "LoadOmo.momd") else { fatalError("model version not found") }
        // Loading the *.mom file works without any problem:
        // guard let url = modelBundle.url(forResource: "LoadOmo", withExtension: "mom", subdirectory: "LoadOmo.momd") else { fatalError("model version not found") }
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: url) else { fatalError("cannot open model at \(url)") }

        let container = NSPersistentContainer(name: "LoadOmo", managedObjectModel: managedObjectModel)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })

        return true
    }
}
