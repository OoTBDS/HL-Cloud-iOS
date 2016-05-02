//
//  Managers.swift
//  Owncloud iOs Client
//
//  Created by Gonzalo Gonzalez on 10/3/15.
//

/*
Copyright (C) 2015, ownCloud, Inc.
This code is covered by the GNU Public License Version 3.
For distribution utilizing Apple mechanisms please see https://owncloud.org/contribute/iOS-license-exception/
You should have received a copy of this license
along with this program. If not, see <http://www.gnu.org/licenses/gpl-3.0.en.html>.
*/

import UIKit

extension String {
    
    var lastPathComponent: String {
        
        get {
            return (self as NSString).lastPathComponent
        }
    }
    var pathExtension: String {
        
        get {
            
            return (self as NSString).pathExtension
        }
    }
    var stringByDeletingLastPathComponent: String {
        
        get {
            
            return (self as NSString).stringByDeletingLastPathComponent
        }
    }
    var stringByDeletingPathExtension: String {
        
        get {
            
            return (self as NSString).stringByDeletingPathExtension
        }
    }
    var pathComponents: [String] {
        
        get {
            
            return (self as NSString).pathComponents
        }
    }
    
    func stringByAppendingPathComponent(path: String) -> String {
        
        let nsSt = self as NSString
        
        return nsSt.stringByAppendingPathComponent(path)
    }
    
    func stringByAppendingPathExtension(ext: String) -> String? {
        
        let nsSt = self as NSString  
        
        return nsSt.stringByAppendingPathExtension(ext)  
    }
}

class Managers: NSObject {
    
    //MARK: FMDataBase
    class var sharedDatabase: FMDatabaseQueue {
        struct Static {
            static var sharedDatabase: FMDatabaseQueue?
            static var tokenDatabase: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.tokenDatabase) {
            Static.sharedDatabase = FMDatabaseQueue()
            
            let documentsDir = UtilsUrls.getOwnCloudFilePath()
            //mv
            let dbPath = documentsDir.stringByAppendingPathComponent("DB.sqlite")
            //let writePath = NSURL(fileURLWithPath: NSTemporaryDirectory()).URLByAppendingPathComponent("instagram.igo")
//             let dbPath = documentsDir.URLByAppendingPathComponent("DB.sqlite")
            
            Static.sharedDatabase = FMDatabaseQueue(path: dbPath, flags: SQLITE_OPEN_CREATE|SQLITE_OPEN_READWRITE|SQLITE_OPEN_FILEPROTECTION_NONE)
        }
        
        return Static.sharedDatabase!
    }
    
    
    //MARK: OCCommunication
    class var sharedOCCommunication: OCCommunication {
        struct Static {
            static var sharedOCCommunication: OCCommunication?
            static var tokenCommunication: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.tokenCommunication) {
            Static.sharedOCCommunication = OCCommunication()
        }
        
        return Static.sharedOCCommunication!
    }
}






