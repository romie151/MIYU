//
//  HomepageViewController.swift
//  Miyu
//
//  Created by Mira Estil on 1/29/18.
//  Copyright © 2018 ME. All rights reserved.
//

import UIKit

class HomepageViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: SETUP
    private func setup() {
        // Tableview setup
        tableView.register(UINib(nibName: Constants.homeXib, bundle: nil),
                           forCellReuseIdentifier: Constants.homeCell)
    }
}

extension HomepageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.homeCell, for: indexPath) as! HomepageTableViewCell
        cell.setup()
        return cell
    }
}

extension HomepageViewController: UIBarPositioningDelegate {
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}