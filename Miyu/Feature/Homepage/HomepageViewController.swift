//
//  HomepageViewController.swift
//  Miyu
//
//  Created by Mira Estil on 1/29/18.
//  Copyright © 2018 ME. All rights reserved.
//

import UIKit
import Firebase

internal final class HomepageViewController: BaseViewController {
    private var allPosts = [[String:String]]()

    private var fbManager = FirebaseUserManager.manager
    
    private weak var currentUser: AppUser?
    private var viewModel: HomepageViewModel? {
        return HomepageViewModel(self)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.setup(tableView)
        fetchPosts()
   
    }
    
    private func fetchPosts() {
        fbManager.fetchPosts(eventType: .childAdded) { (snapshot) in
            if let dict = snapshot.value as? [String:String] {
                self.allPosts.append(dict)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    private func fetchPhoto(_ urlString: String?, _ cell: HomepageTableViewCell) {
        if let urlString = urlString {
            cell.contentImage.loadCachedImage(urlString)
        }
    }

}

extension HomepageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.homeCell, for: indexPath) as! HomepageTableViewCell
        
        // Labels
        cell.nameLabel.text = allPosts[indexPath.row]["caption"]
        fetchPhoto(allPosts[indexPath.row]["data"], cell)
        
        // Rating
        let rating: Double = Double((indexPath as NSIndexPath).row) / 99 * 5
        cell.update(rating)
        
        cell.setupTap(indexPath.row)
        // Image Interaction segue to profile
        
//        cell.profileImage.isUserInteractionEnabled = true
//        cell.profileImage.tag = indexPath.row
//        
//        let tapped = UITapGestureRecognizer(target: self, action: #selector(myFunction))
//        tapped.numberOfTapsRequired = 1
//        cell.profileImage.addGestureRecognizer(tapped)
        
        return cell
    }
    
//    @objc func myFunction(gesture: UITapGestureRecognizer) {
//        print("it worked")
//    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: Constants.homeCellSegue, sender: self)
//    }
    
}

extension HomepageViewController: UIBarPositioningDelegate {
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}
