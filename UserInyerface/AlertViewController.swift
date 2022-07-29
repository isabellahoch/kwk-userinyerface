//
//  AlertViewController.swift
//  UserInyerface
//
//  Created by Scholar on 7/28/22.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert(_ sender: Any) {
        if(Int.random(in:0...2)>1) {
            showAlert()
        }
        else {
            showAlertWithTextField()
        }
    }
    
    func showAlertWithTextField() {
            let alertController = UIAlertController(title: "Time is ticking ⏰ Type OK", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (_) in }
        alertController.addTextField { (textField) in
            textField.placeholder = "Tag"
        }
            let confirmAction = UIAlertAction(title: "Go (Away)", style: .cancel) { (_) in
                if let txtField = alertController.textFields?.first, let text = txtField.text {
                    if(text != "OK") {
                        self.showAlertWithTextField()
                    }
                    // operations
                    print("Text==>" + text)
                }
            }
            
        cancelAction.isEnabled = false
            alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
            self.present(alertController, animated: true, completion: nil)
        }
    
    func showAlert() {
        let alert = UIAlertController(title: "Hurry Up!!!!!", message: "Time is ticking ⏰",         preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.destructive, handler: { _ in
                //Cancel Action
            }))
        var doNothing = UIAlertAction(title: "Do Nothing",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
            self.showAlert()
        })
        doNothing.isEnabled = false
        alert.addAction(doNothing)
        self.present(alert, animated: true, completion: nil)
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
