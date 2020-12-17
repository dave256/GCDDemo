//
//  SecondViewController.swift
//  GCDDemo
//
//  Created by David M Reed on 3/9/17.
//  Copyright © 2017 David M Reed. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func shortButtonPressed(_ sender: UIButton) {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .long
        let date = formatter.string(from: Date())
        dateLabel.text = "short button pressed \(date)"
    }

    @IBAction func longButtonPressed(_ sender: UIButton) {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .long
        var date = formatter.string(from: Date())
        dateLabel.text = "long button pressed \(date)"

        DispatchQueue.global(qos: .background).async {
            sleep(5)
            date = formatter.string(from: Date())
            weak var weakSelf = self
            DispatchQueue.main.sync {
                weakSelf?.dateLabel.text = "long button action done \(date)"
            }
        }
    }
}

