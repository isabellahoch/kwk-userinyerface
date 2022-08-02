//
//  LogInViewController.swift
//  UserInyerface
//
//  Created by Scholar on 7/29/22.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var noAccountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noAccountLabel.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        noAccountLabel.isHidden = false
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
