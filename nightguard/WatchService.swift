//
//  WatchService.swift
//  nightguard
//
//  Created by Dirk Hermanns on 05.06.16.
//  Copyright © 2016 private. All rights reserved.
//

import Foundation
import WatchConnectivity

class WatchService {
    
    static let singleton = WatchService()
    
    func sendToWatch(units : Units) {
        do {
            let applicationDict = ["units" : units.rawValue]
            try WCSession.defaultSession().transferUserInfo(applicationDict)
        } catch {
            print(error)
        }
    }
    
    func sendToWatch(alertIfBelowValue : Float, alertIfAboveValue : Float) {
        do {
            let applicationDict = ["alertIfBelowValue" : alertIfBelowValue,
                                   "alertIfAboveValue" : alertIfAboveValue]
            try WCSession.defaultSession().transferUserInfo(applicationDict)
        } catch {
            print(error)
        }
    }
    
    func sendToWatch(hostUri : String) {
        do {
            let applicationDict = ["hostUri" : hostUri]
            try WCSession.defaultSession().transferUserInfo(applicationDict)
        } catch {
            print(error)
        }
    }
    
    func sendToWatch(hostUri : String, alertIfBelowValue : Float, alertIfAboveValue : Float, units : Units) {
        do {
            let applicationDict = ["hostUri" : hostUri,
                                   "alertIfBelowValue" : alertIfBelowValue,
                                   "alertIfAboveValue" : alertIfAboveValue,
                                   "units" : units.rawValue]
            try WCSession.defaultSession().transferUserInfo(applicationDict as! [String : AnyObject])
        } catch {
            print(error)
        }
    }
}
