//
//  CloudKitManager.swift
//  TImeline
//
//  Created by Chandi Abey  on 9/13/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import Foundation
import CloudKit


class CloudKitManager {
    
    let publicDatabase: CKDatabase = CKContainer.defaultContainer().publicCloudDatabase
    let privateDatabase: CKDatabase = CKContainer.defaultContainer().privateCloudDatabase
    
    init() {
    // check CloudKit availability
        checkCloudKitAvailability()
    }
    
    // MARK: - User Info Discovery
    
    func fetchLoggedInUserRecord(completion: ((record: CKRecord?, error: NSError?) -> Void)?)
    
    func fetchUsernameFromRecordID(recordID: CKRecordID, completion: ((givenName: String?, familyName: String?) -> Void)?)
    
    func fetchAllDiscoverableUsers(completion: ((userInfoRecords: [CKDiscoveredUserInfo]?) -> Void)?)
    
    
    // MARK: - Fetch Records
    
    func fetchRecordWithID(recordID: CKRecordID, completion: ((record: CKRecord?, error: NSError?) -> Void)?)
    
    func fetchRecordsWithType(type: String, predicate: NSPredicate = default, recordFetchedBlock: ((record: CKRecord) -> Void)?, completion: ((records: [CKRecord]?, error: NSError?) -> Void)?)
    
    func fetchCurrentUserRecords(type: String, completion: ((records: [CKRecord]?, error: NSError?) -> Void)?)
    
    func fetchRecordsFromDateRange(type: String, recordType: String, fromDate: NSDate, toDate: NSDate, completion: ((records: [CKRecord]?, error: NSError?) -> Void)?)
    
    
    // MARK: - Delete Records
    
    func deleteRecordWithID(recordID: CKRecordID, completion: ((recordID: CKRecordID?, error: NSError?) -> Void)?)
    
    func deleteRecordsWithID(recordIDs: [CKRecordID], completion: ((records: [CKRecord]?, recordIDs: [CKRecordID]?, error: NSError?) -> Void)?)
    
    
    // MARK: - Save Records
    
    func saveRecords(records: [CKRecord], perRecordCompletion: ((record: CKRecord?, error: NSError?) -> Void)?, completion: ((records: [CKRecord]?, error: NSError?) -> Void)?)
    
    func saveRecord(record: CKRecord, completion: ((record: CKRecord?, error: NSError?) -> Void)?) {
        
        privateDatabase.saveRecord(record) { (record, error) in
            <#code#>
        }
    }
    
    func modifyRecords(records: [CKRecord], perRecordCompletion: ((record: CKRecord?, error: NSError?) -> Void)?, completion: ((records: [CKRecord]?, error: NSError?) -> Void)?)
    
    
    // MARK: - CloudKit Availability
    
    func checkCloudKitAvailability()
    
    func handleCloudKitUnavailable(accountStatus: CKAccountStatus, error: NSError?)
    
    func displayCloudKitNotAvailableError(errorText: String)
    
    
    // MARK: - CloudKit User Discoverability
    
    func requestDiscoverabilityPermission()
    
    func handleCloudKitPermissionStatus(permissionStatus: CKApplicationPermissionStatus, error: NSError?)
    
    func displayCloudKitPermissionsNotGrantedError(errorText: String)
    
    
    
}