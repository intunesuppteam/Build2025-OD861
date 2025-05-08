//
//  ViewController.swift
//  helloworldBuild
//
//  Created by Raheem Chisman on 5/2/25.
//

import UIKit
import IntuneMAMSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var hwButton: UIButton!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var getLogs: UIButton!
    
    @IBOutlet weak var logInBtn: UIButton!
    
    @IBOutlet weak var unEnroll: UIButton!
    //var Emojis

      private let emojis = ["🥷🏾","😼", "𝐂𝐗𝐄","😎", "🎭", "🤩", "🫶🏿","🥸Hello World!"]

      private var currentEmojiIndex = 0
    

@IBAction func hwButtonTapped(_ sender: Any) {
    //print  msg to console

         print("Hello World!")

         textView.text = emojis[currentEmojiIndex]

         textView.textAlignment = .center

         textView.font = UIFont.systemFont(ofSize: 100)

    //cycle through emoji Hello World

        currentEmojiIndex = (currentEmojiIndex + 1) % emojis.count
    }
    
    @IBAction func logInBtn(_ sender: Any) {
           //Set the delegate of the IntuneMAMEnrollmentManager as an instance of the EnrollmentDelegateClass to check the status of attempted enrollments. Also initialize this class with the current view controller
           //This is done on launch, but here it is done again to give the delegate the current view controller
           let enrollmentDelegate = EnrollmentDelegate.init(viewController: self)
           IntuneMAMEnrollmentManager.instance().delegate = enrollmentDelegate
           
           //Login the user through the Intune sign in flow. EnrollmentDelegateClass will handle the outcome of this.
           IntuneMAMEnrollmentManager.instance().loginAndEnrollAccount(nil)
       }
       
       @IBAction func getLogs(_ sender: Any) {
           IntuneMAMDiagnosticConsole.display()
       }
       
       
       @IBAction func unEnroll(_ sender: Any) {
                 let enrolledAccountId = IntuneMAMEnrollmentManager.instance().enrolledAccountId()
                   print("Starting unEnrollment forObjectid:" + enrolledAccountId!)
           IntuneMAMEnrollmentManager.instance().deRegisterAndUnenrollAccountId(enrolledAccountId!, withWipe: false)
       }

    
    }




