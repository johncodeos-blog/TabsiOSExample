//
//  Demo2ViewController.swift
//  TabsExample
//
//  Created by John Codeos on 5/22/20.
//  Copyright © 2020 John Codeos. All rights reserved.
//

import UIKit

class Demo2ViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!

    var name: String = ""

    var pageIndex: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = "\(name) ViewController"
    }
}
