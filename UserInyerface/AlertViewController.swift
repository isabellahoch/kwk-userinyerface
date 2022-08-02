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
    
    // see https://medium.com/swift-india/uialertcontroller-in-swift-22f3c5b1dd68 for more info!
    
    @IBAction func showAlert(_ sender: Any)
    // randomize which alert will show :)
    {
        if(Int.random(in:0...2)>1) {
            showAlert()
        }
        else {
            showAlertWithTextField()
        }
    }
    
    // this function will make an alert with a textbox pop up on the screen!
    func showAlertWithTextField() {
        let alertController = UIAlertController(title: "Time is ticking ⏰ Type OK", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (_) in }
        alertController.addTextField { (textField) in
            textField.placeholder = "Write OK"
        }
            let confirmAction = UIAlertAction(title: "Go (Away)", style: .cancel) { (_) in
                if let txtField = alertController.textFields?.first, let text = txtField.text {
                    if(text != "OK") {
                        self.showAlertWithTextField()
                    }
                }
            }
            
        cancelAction.isEnabled = false
            alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
            self.present(alertController, animated: true, completion: nil)
        }
    
    // this function will make an alert pop up on the screen!
    func showAlert() {
        let alert = UIAlertController(title: "Hurry Up!!!!!", message: "Time is ticking ⏰",         preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.destructive, handler: { _ in
                //Cancel Action
            }))
        let doNothing = UIAlertAction(title: "Do Nothing",
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
