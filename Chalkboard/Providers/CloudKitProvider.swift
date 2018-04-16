//
//  CloudKitProvider.swift
//  Chalkboard
//
//  Created by Connor Smith on 4/15/18.
//  Copyright © 2018 Connor Smith. All rights reserved.
//

import UIKit
import CloudKit

class CloudKitProvider: NSObject {

    weak var alertPresenter: AlertPresenter?

    func authenticate() {
        CKContainer.default().accountStatus { (accountStatus, error) in
            if (accountStatus == CKAccountStatus.noAccount) {
                self.showLoginAlert()
            }
        }
    }

    private func showLoginAlert() {
        let alert = alertController(withTitle: UserFacingStrings.CloudKit.SignInTitle, message: UserFacingStrings.CloudKit.SignInMessage, cancelButtonTitle: UserFacingStrings.Common.Okay)
        alertPresenter?.presentAlert(alert)
    }

}

// MARK: Sync Records

extension CloudKitProvider {

    func createTestRecord() {
        let testListRecordId = CKRecordID(recordName: "test list")
        let testRecord = CKRecord(recordType: "List", recordID: testListRecordId)
        testRecord["title"] = "List" as CKRecordValue
        saveRecord(testRecord)
    }

    private func saveRecord(_ record: CKRecord) {
        let myContainer = CKContainer.default()
        let publicDatabase = myContainer.publicCloudDatabase
        publicDatabase.save(record) { [weak self]
            (record, error) in
            if let error = error {
                self?.showSyncError(error)
            } else {
                print("yay!")
            }

        }
    }

    private func showSyncError(_ error: Error?) {
        let alert = alertController(withTitle: UserFacingStrings.Network.Error.Title, message: UserFacingStrings.Network.Error.Message, cancelButtonTitle: UserFacingStrings.Common.Okay)
        alertPresenter?.presentAlert(alert)
    }
}

// MARK: Helper

extension CloudKitProvider {
    func alertController(withTitle title: String?, message: String?, cancelButtonTitle: String?) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: nil))
        return alertController
    }
}
