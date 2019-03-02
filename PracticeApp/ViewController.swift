//
//  ViewController.swift
//  PracticeApp
//
//  Created by chang1019 on 2019/02/28.
//  Copyright © 2019 chang1019. All rights reserved.
//

import UIKit

class ViewController:
    UIViewController,
    UITableViewDelegate,
    UITableViewDataSource
{
    @IBOutlet weak var tableView: UITableView!

    private let data: [(String,String)] = [
        ("りんご", "Apple"),
        ("みかん", "Orange"),
        ("ぶどう", "Grape"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

	self.title = "フルーツ"
    }

    // UITableViewDataSource

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int
    {
        return data.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                                  for: indexPath)

        let rowIndex: Int = indexPath[1]
        cell.textLabel?.text = data[rowIndex].0
        cell.detailTextLabel?.text = data[rowIndex].1
        return cell
    }
}

