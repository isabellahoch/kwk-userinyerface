//
//  SignUpViewController.swift
//  UserInyerface
//
//  Created by Scholar on 7/28/22.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    var activeTextField : UITextField? = nil
    
    @IBOutlet weak var emailIsValid: UILabel!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var passwordIsValid: UILabel!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var toNext: UIButton!
    @IBOutlet weak var termsAndConditions: UISwitch!
    @IBOutlet weak var buttonText: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailIsValid.textColor =  UIColor.green
        emailIsValid.text = "Email is invalid. It must contain @ and ."
        toNext.isHidden = true
        buttonText.isHidden = toNext.isHidden
        
        // dismisses keyboard if you tap anywhere around it
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        // alternate way to dismiss keyboard
        let center = NotificationCenter.default
        
        let mainQueue = OperationQueue.main
        
        center.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: mainQueue) { (notif) in
            self.keyboardWillShow(notification: notif as NSNotification)
        }
        
        center.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: mainQueue) { (notif) in
            self.keyboardWillHide(notification: notif as NSNotification)
        }
        
        // add delegate to all textfields to self (this view controller)
            email.delegate = self
            password.delegate = self
    }
    
    // dismiss current keyboard on return key!
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {

            // if keyboard size is not available for some reason, dont do anything
            return
          }

          var shouldMoveViewUp = false

          // if active text field is not nil
          if let active = activeTextField {

            let bottomOfTextField = active.convert(active.bounds, to: self.view).maxY;
            
            let topOfKeyboard = self.view.frame.height - keyboardSize.height

            // if the bottom of Textfield is below the top of keyboard, move up
            if bottomOfTextField > topOfKeyboard {
              shouldMoveViewUp = true
            }
          }

          if(shouldMoveViewUp || activeTextField == password) {
            self.view.frame.origin.y = 0 - keyboardSize.height
          }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
      // move back the root view origin to zero
      self.view.frame.origin.y = 0
    }
    
    @IBAction func emailEditingDidBegin(_ sender: Any) {
        activeTextField = email
    }
    
    @IBAction func passwordEditingDidBegin(_ sender: Any) {
        activeTextField = password
    }
    
    @IBAction func emailValChanged(_ sender: Any) {
        validateEmail()
    }
    
    @IBAction func emailEditingEnded(_ sender: Any) {
        validateEmail()
        activeTextField = nil
    }
    
    @IBAction func emailEditingChanged(_ sender: Any) {
        validateEmail()
    }
    
    @IBAction func passwordValChanged(_ sender: Any) {
        validatePassword()
    }
    
    @IBAction func passwordEditingEnded(_ sender: Any) {
        validatePassword()
        activeTextField = nil
    }
    
    @IBAction func passwordEditingChanged(_ sender: Any) {
        validatePassword()
    }
    
    
    @IBAction func goToNext(_ sender: Any) {
        if(emailIsValid.textColor == UIColor.red && passwordIsValid.textColor == UIColor.red && (!termsAndConditions.isOn)) {
            performSegue(withIdentifier: "segueFromSignUp", sender: nil)
        }
    }
    
    func showOrHideNext() {
        if(emailIsValid.textColor == UIColor.red && passwordIsValid.textColor == UIColor.red && (!termsAndConditions.isOn)) {
            toNext.isHidden = false
        }
        else {
            toNext.isHidden = true
        }
        buttonText.isHidden = toNext.isHidden
    }
    
    func validateEmail() {
        if(email.text! != "Your Email" && email.text!.contains("@") && email.text!.contains(".")) {
            emailIsValid.text = "Email is not invalid. It must contain @ and ."
            emailIsValid.textColor =  UIColor.red
        }
        else {
            emailIsValid.text = "Email is invalid. It must contain @ and ."
            emailIsValid.textColor =  UIColor.green
        }
        showOrHideNext()
    }
    
    func validatePassword() {
        if(password.text! != "Your Password" && password.text!.count >= 10 && stringContainsNumber(_string: password.text!) && checkTextSufficientComplexity(text:password.text!)) {
            passwordIsValid.textColor =  UIColor.red
        }
        else {
            passwordIsValid.textColor =  UIColor.green
        }
        showOrHideNext()
    }
    
    func stringContainsNumber( _string : String) -> Bool{
            let numberRegEx  = ".*[0-9]+.*"
            let testCase = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let containsNumber = testCase.evaluate(with: _string)

            return containsNumber
    }
    
    func checkTextSufficientComplexity(text : String) -> Bool{


        let capitalLetterRegEx  = ".*[A-Z]+.*"
        var texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        var capitalresult = texttest.evaluate(with: text)
        let specialCharacterRegEx  = ".*[!&^%$#@()/]+.*"
        var texttest1 = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        var specialresult = texttest1.evaluate(with: text)
        return capitalresult && specialresult

    }
    
    @IBAction func switchValueChanged(_ sender: Any) {
        showOrHideNext()
    }
    
    @IBAction func switchPrimaryActionTriggered(_ sender: Any) {
        showOrHideNext()
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
