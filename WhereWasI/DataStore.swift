//
//  DataStore.swift
//  WhereWasI
//
//  Created by Gustavo Colaco on 21/06/17.
//  Copyright © 2017 Gustavo Colaço. All rights reserved.
//

import Foundation

struct StorageKeys {
    
    static let storedLat = "storedLat"
    static let storedLong =  "storedLong"
    
}


class DataStore{
    
    func GetDefaults () -> UserDefaults{
        return UserDefaults.standard
    }
    
    func StoreDataPoint (latitude: String, longitude: String){
        let def = GetDefaults()
        
        def.setValue(latitude, forKey: StorageKeys.storedLat)
        def.setValue(longitude, forKey: StorageKeys.storedLong)
        
        def.synchronize()
    }
    
    
    func GetLastLocation () -> VisitedPoint?{
        
        let defaults = GetDefaults()
        
        if let lat = defaults.string(forKey: StorageKeys.storedLat){
            if let long = defaults.string(forKey: StorageKeys.storedLong){
                return VisitedPoint(lat: lat, long: long)
            }
        }
        return nil
    }
    
    
    
    
}











