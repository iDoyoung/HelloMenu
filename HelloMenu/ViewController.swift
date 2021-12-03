//
//  ViewController.swift
//  HelloMenu
//
//  Created by Doyoung on 2021/12/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        button.menu = menu
        button.showsMenuAsPrimaryAction = true
    }
    private lazy var menuItems: [UIAction] = {
        return [
            UIAction(
                title: "Hello World!",
                image: UIImage(systemName: "figure.wave"),
                handler: { _ in
                    print("Hello World!")
                }),
            UIAction(
                title: "Morning World!",
                image: UIImage(systemName: "cloud.sun.fill"),
                handler: { _ in
                    print("Moring World!")
                }),
            UIAction(
                title: "Night World!",
                image: UIImage(systemName: "moon.stars.fill"),
                handler: { _ in
                    print("Night World!")
                })
        ]
    }()
    
    private lazy var menu: UIMenu = {
        return UIMenu(title: "", options: [], children: menuItems)
    }()
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? Cell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = "Hello!"
        return cell
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil,
                                          previewProvider: nil,
                                          actionProvider: {_ in
            return self.menu
        })
    }
}

class Cell: UITableViewCell {
    
}
