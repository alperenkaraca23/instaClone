//
//  SettingsViewController.swift
//  InstaClone
//
//  Created by Alperen KARACA on 28.07.2024.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutClicked(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        }catch {
            print("Error!!")
        }

    }
    
 
}
