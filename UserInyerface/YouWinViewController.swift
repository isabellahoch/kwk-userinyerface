//
//  YouWinViewController.swift
//  UserInyerface
//
//  Created by Scholar on 7/28/22.
//

import UIKit
import Foundation

class YouWinViewController: UIViewController {
    
    var record : String = ""
    
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myGif = UIImage.gifImageWithName("carlton-dancing")
       let imageView = UIImageView(image: myGif)
       imageView.frame = CGRect(x: 20.0, y: 390.0, width: self.view.frame.size.width - 40, height: 250.0)
       view.addSubview(imageView)
        
        record = Timer.currentTime()
        
//        let delta = Timer.dateStarted - Date()
//
//        let differenceInSeconds = Int(Date().timeIntervalSince(Timer.dateStarted))
//
//        print("delta: \(delta)")
//
//        var time = "\(delta) seconds"
//
//        if(differenceInSeconds > 360) {
//            time = "\(differenceInSeconds / (60*60)) hours, \(Int(differenceInSeconds%(60*60) / 60)) minutes, \(differenceInSeconds%60)"
//        }
//
        result.text = "YAY! You completed the challenge in\n\(record)!!!"
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        share(sender:sender)
    }
    
    @IBAction func otherShareButtonTapped(_ sender: Any) {
        share(sender:sender)
    }
    
    func share(sender: Any) {
        // Setting description
         let firstActivityItem = "I finished the Kode with Klossy User Inyerface Challenge 👩‍💻 in \(record)!! Try it for yourself 😈"

         // Setting url
         let secondActivityItem : NSURL = NSURL(string: "http://github.com/isabellahoch/kwk-userinyerface")!
         
         // If you want to use an image
         let image : UIImage = UIImage(named: "kwkUI")!
         let activityViewController : UIActivityViewController = UIActivityViewController(
             activityItems: [firstActivityItem, secondActivityItem, image], applicationActivities: nil)
         
         // This lines is for the popover you need to show in iPad
         activityViewController.popoverPresentationController?.sourceView = (sender as! UIButton)
         
         // This line remove the arrow of the popover to show in iPad
         activityViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.down
         activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 150, width: 0, height: 0)
         
         // Pre-configuring activity items
         activityViewController.activityItemsConfiguration = [
         UIActivity.ActivityType.message
         ] as? UIActivityItemsConfigurationReading
         
         // Anything you want to exclude
         activityViewController.excludedActivityTypes = [
             UIActivity.ActivityType.postToWeibo,
             UIActivity.ActivityType.print,
             UIActivity.ActivityType.assignToContact,
             UIActivity.ActivityType.saveToCameraRoll,
             UIActivity.ActivityType.addToReadingList,
             UIActivity.ActivityType.postToFlickr,
             UIActivity.ActivityType.postToVimeo,
             UIActivity.ActivityType.postToTencentWeibo,
             UIActivity.ActivityType.postToFacebook
         ]
         
         activityViewController.isModalInPresentation = true
         self.present(activityViewController, animated: true, completion: nil)
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
