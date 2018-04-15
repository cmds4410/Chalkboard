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

    func authenticate(presenter: AlertPresenter?) {
        CKContainer.default().accountStatus { (accountStatus, error) in
            if (accountStatus == CKAccountStatus.noAccount) {
                self.showLoginAlert(presenter: presenter)
            }
        }
    }

    private func showLoginAlert(presenter: AlertPresenter?) {
        let alertController = UIAlertController(title: "Sign in to iCloud", message: "Sign in to your iCloud account to write records. On the Home screen, launch Settings, tap iCloud, and enter your Apple ID. Turn iCloud Drive on. If you don't have an iCloud account, tap Create a new Apple ID.", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.cancel, handler: nil))
        presenter?.presentAlert(alert: alertController)
    }
}
