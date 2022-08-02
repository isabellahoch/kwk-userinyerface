//
//  YouWinViewController.swift
//  UserInyerface
//
//  Created by Scholar on 7/28/22.
//

import UIKit
import Foundation
import CoreData

class YouWinViewController: UIViewController {
    
    var record : String = ""
    
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // demo adding in gif
        
        let myGif = UIImage.gifImageWithName("carlton-dancing")
       let imageView = UIImageView(image: myGif)
       imageView.frame = CGRect(x: 20.0, y: 390.0, width: self.view.frame.size.width - 40, height: 250.0)
       view.addSubview(imageView)
        
        record = Timer.currentTime()
        
        // time delta example (commented out in this case!)
//        let delta = Timer.dateStarted - Date()
//
//        let differenceInSeconds = Int(Date().timeIntervalSince(Timer.dateStarted))
//
//        var time = "\(delta) seconds"
//
//        if(differenceInSeconds > 360) {
//            time = "\(differenceInSeconds / (60*60)) hours, \(Int(differenceInSeconds%(60*60) / 60)) minutes, \(differenceInSeconds%60)"
//        }
//
        result.text = "YAY! You completed the challenge in\n\(record)!!!"
        
        saveToCoreData()
        
        // Do any additional setup after loading the view.
    }
    
    func saveToCoreData() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            // we are creating a new Attempt object here, naming it attempt
            let attempt = Attempt(entity: Attempt.entity(), insertInto: context)
            
            attempt.dateStarted = Timer.dateStarted
            attempt.record = record
            attempt.seconds = Double(Timer.seconds())
            
            try? context.save()
            
        }
    }
    
    // SHARE MENU EXAMPLE!
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        // Setting description
        let firstActivityItem = "I finished the Kode with Klossy User Inyerface Challenge 👩‍💻 in \(record)!! Try it for yourself 😈"

        // Setting url
        let link =  "http://github.com/isabellahoch/kwk-userinyerface"
        
        // Setting image (file name should be the same as in the assets folder!)
        let imageFileName = "kwkUI"
        
        share(sender:sender, text: firstActivityItem, urlString: link, imageFileName: imageFileName)
    }
    
    @IBAction func otherShareButtonTapped(_ sender: Any) {
        
        // Setting description
        let firstActivityItem = "I finished the Kode with Klossy User Inyerface Challenge 👩‍💻 in \(record)!! Try it for yourself 😈"

        // Setting url
        let link =  "http://github.com/isabellahoch/kwk-userinyerface"
        
        // Setting image (file name should be the same as in the assets folder!)
        let imageFileName = "kwkUI"
        
        share(sender:sender, text: firstActivityItem, urlString: link, imageFileName: imageFileName)
    }
    
    // copy the below function and use it to
    func share(sender: Any, text : String, urlString : String, imageFileName : String) {
        
        let url : NSURL = NSURL(string: urlString)!
        let image : UIImage = UIImage(named: "kwkUI")!
        
        // Setting description
         
         let activityViewController : UIActivityViewController = UIActivityViewController(
             activityItems: [text, url, image], applicationActivities: nil)
         
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
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let previousAttempts = segue.destination as? PreviousAttemptsTableViewController {
            previousAttempts.getAttempts()
            previousAttempts.tableView.reloadData()
        }
    }
}
