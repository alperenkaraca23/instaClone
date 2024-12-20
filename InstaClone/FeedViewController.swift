//
//  FeedViewController.swift
//  InstaClone
//
//  Created by Alperen KARACA on 28.07.2024.
//

import UIKit
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth
import SDWebImage

class FeedViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var userEmailArray = [String]()
    var userCaptureArray = [String]()
    var likeArray = [Int]()
    var userImageArray = [String]()
    var documentIdArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
        
        
        getDataFromFirestore()
        
    }
    
    func getDataFromFirestore() {
        
        
        
        let fireStoreDatabase = Firestore.firestore()
        /*
         let settings = fireStoreDatabase.settings
         settings.areTimestampsInSnapshotsEnabled = true
         fireStoreDatabase.settings = settings
         */
        
        fireStoreDatabase.collection("Posts").order(by: "date", descending: true).addSnapshotListener { (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription ?? "Error!!")
            }else {
                
                if snapshot?.isEmpty != true && snapshot != nil {
                    
                    self.userImageArray.removeAll(keepingCapacity: false)
                    self.likeArray.removeAll(keepingCapacity: false)
                    self.userCaptureArray.removeAll(keepingCapacity: false)
                    self.userEmailArray.removeAll(keepingCapacity: false)
                    self.documentIdArray.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        self.documentIdArray.append(documentID)
                        
                        if let postedBy = document.get("postedBy") as? String {
                            self.userEmailArray.append(postedBy)
                        }
                        
                        if let postCapture = document.get("postCapture") as? String {
                            self.userCaptureArray.append(postCapture)
                        }
                        
                        if let likes = document.get("likes") as? Int {
                            self.likeArray.append(likes)
                        }
                        
                        if let imageUrl = document.get("imageUrl") as? String {
                            self.userImageArray.append(imageUrl)
                        }
                        
                        
                    }
                    self.tableView.reloadData()
                    
                    
                    
                }
            }
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userCaptureArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.userEmail.text = userEmailArray[indexPath.row]
        cell.likeLabel.text = String(likeArray[indexPath.row])
        cell.captureLabel.text = userCaptureArray[indexPath.row]
        cell.userImageView.sd_setImage(with: URL(string: self.userImageArray[indexPath.row]), placeholderImage: UIImage(named: "images"), context: nil)
        cell.documentIdLabel.text = documentIdArray[indexPath.row]
        return cell
    }
}

