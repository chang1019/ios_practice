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
    private let data: [(String,String)] = [
        ("りんご", "Apple"),
        ("みかん", "Orange"),
        ("ぶどう", "Grape"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView: UITableView = UITableView(frame: view.frame, style: .plain)
        tableView.register(TableCellView.self, forCellReuseIdentifier: TableCellView.ID)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
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
        let cell: TableCellView = tableView.dequeueReusableCell(withIdentifier: TableCellView.ID,
                                                                for: indexPath) as! TableCellView

        let rowIndex: Int = indexPath[1]
        cell.setCellInfo(title: data[rowIndex].0, detail: data[rowIndex].1)
        return cell
    }
}

class TableCellView: UITableViewCell
{
    static let ID: String = "cell"
    private let cellStyle: CellStyle = CellStyle.subtitle
    private let cellColor: UIColor = UIColor(red: 0.6, green: 0.8, blue: 0.9, alpha: 0.9)

    required init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: cellStyle, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = cellColor
    }

    // original methods

    func setCellInfo(title: String, detail: String) {
        self.textLabel?.text = title
        self.detailTextLabel?.text = detail
    }
}
