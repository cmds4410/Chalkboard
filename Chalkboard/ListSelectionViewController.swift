//
//  ListSelectionViewController.swift
//  Chalkboard
//
//  Created by Connor Smith on 4/15/18.
//  Copyright © 2018 Connor Smith. All rights reserved.
//

import UIKit

protocol AlertPresenter {
    func presentAlert(alert: UIAlertController)
}

class ListSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chalkboard"
    }

}

extension ListSelectionViewController: AlertPresenter {
    func presentAlert(alert: UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }
}
