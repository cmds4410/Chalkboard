//
//  ListSelectionViewController.swift
//  Chalkboard
//
//  Created by Connor Smith on 4/15/18.
//  Copyright © 2018 Connor Smith. All rights reserved.
//

import UIKit

protocol AlertPresenter: AnyObject {
    func presentAlert(_ alert: UIAlertController)
}

class ListSelectionViewController: UIViewController {

    let cloudKitProvider = CloudKitProvider()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chalkboard"
        cloudKitProvider.alertPresenter = self
        cloudKitProvider.createTestRecord()
    }

}

extension ListSelectionViewController: AlertPresenter {
    func presentAlert(_ alert: UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }
}
