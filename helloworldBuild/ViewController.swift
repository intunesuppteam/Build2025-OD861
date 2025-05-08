//
//  ViewController.swift
//  helloworldBuild
//
//  Created by Raheem Chisman on 5/2/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hwButton: UIButton!
    
    @IBOutlet weak var textView: UITextView!
    
    
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
    
    
    }




