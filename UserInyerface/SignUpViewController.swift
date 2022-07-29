//
//  SignUpViewController.swift
//  UserInyerface
//
//  Created by Scholar on 7/28/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
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
    }
    
    @IBAction func emailValChanged(_ sender: Any) {
        validateEmail()
    }
    
    @IBAction func emailEditingEnded(_ sender: Any) {
        validateEmail()
    }
    
    @IBAction func emailEditingChanged(_ sender: Any) {
        validateEmail()
    }
    
    @IBAction func passwordValChanged(_ sender: Any) {
        validatePassword()
    }
    
    @IBAction func passwordEditingEnded(_ sender: Any) {
        validatePassword()
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
