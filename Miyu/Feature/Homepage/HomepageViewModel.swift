//
//  HomepageViewModel.swift
//  Miyu
//
//  Created by Mira Estil on 2/7/18.
//  Copyright © 2018 ME. All rights reserved.
//

import UIKit
import Firebase
import RealmSwift

internal final class HomepageViewModel: InstantiatedViewControllers {
    private weak var presentingViewController: UIViewController?
    private weak var fbManager = FirebaseUserManager.manager
    private weak var fbService = FirebaseSerivce.shared
    private weak var store = DataStore.sharedInstance
    
    init(_ presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
    }
    
    // MARK: UTILITY
    func setup(_ tableView: UITableView) {
        tableView.register(UINib(nibName: Constants.homeXib, bundle: nil),
                           forCellReuseIdentifier: Constants.homeCell)
    }
    
    func presentVC(vc: PresentViewController) {
        presentDestinationVC(from: self.presentingViewController, to: vc)
    }
    
    // MARK: PREPARE DATA
    
    func getPosts(completionHandler: @escaping ()->()) {
        fbService?.observeAllData(.posts, Post.self, { (post) in
            self.fbService?.getData(.user(uid: post.uid!), AppUser.self, { (user, keyId) in
                user.uid = keyId
                post.user = user
                user.writeToRealm()
                post.writeToRealm()
                completionHandler()
            })
        })
    }
    
    func filterUserPostData() {
        if let uid = fbManager?.currentUser?.uid {
            self.store?.userPosts = uiRealm.objects(Post.self).filter("uid == %@", uid)
        }
    }
}
