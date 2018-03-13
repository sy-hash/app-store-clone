//
//  UpdateViewController.swift
//  AppStoreClone
//
//  Created by s-hashimoto on 2018/02/26.
//  Copyright © 2018年 sy-hash. All rights reserved.
//

import UIKit

class UpdateViewController: UITableViewController {

    var largeTitleBaseView: UIView?
    
    lazy var sectionItems = createData()
    
    let button: UIButton = {
        let button = UIButton(type: .custom)
        let profileImage = R.image.profile()!.withRenderingMode(.alwaysOriginal)
        button.setImage(profileImage, for: UIControlState())
        return button
    }()
    
    convenience init() {
        self.init(style: .grouped)
    }
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "アップデート"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(R.nib.updateCell(), forCellReuseIdentifier: "identifier")
        
        if let largeTitleBaseView = self.navigationController?.navigationBar.subviews[1] {
            largeTitleBaseView.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.trailingAnchor.constraint(equalTo: largeTitleBaseView.trailingAnchor, constant: -10).isActive = true
            button.bottomAnchor.constraint(equalTo: largeTitleBaseView.bottomAnchor, constant: -10).isActive = true
            button.widthAnchor.constraint(equalToConstant: 30).isActive = true
            button.heightAnchor.constraint(equalToConstant: 30).isActive = true
            self.largeTitleBaseView = largeTitleBaseView
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func createData() -> [UpdateAppSectionItem] {
        let rowItems: [UpdateAppRowItem] = [
            UpdateAppRowItem(title: "GIPHY: The GIF Search Engine",
                             version: "2.7.2",
                             description: "The world’s largest library of animated GIFs and stickers, now on your mobile phone! GIPHY for iOS is the fastest, simplest way to search and share GIFs and stickers across all of your favorite social channels such as iMessage,Facebook Messenger and more.",
                             imageFileName: R.image.app_icon_giphy.name),
            UpdateAppRowItem(title: "Infuse Pro 5",
                             version: "5.6.9",
                             description: "Ignite your video content with Infuse – the beautiful way to watch almost any video format on your iPhone, iPad, and Apple TV. No need to convert files! Infuse is optimized for iOS 11, with powerful streaming options, trakt sync, and unmatched AirPlay & subtitle support. Gorgeous interface. Precise controls. And silky-smooth playback.",
                             imageFileName: R.image.app_icon_infuse.name),
            UpdateAppRowItem(title: "Office Lens",
                             version: "2.10.1",
                             description: "Office Lens trims, enhances and makes pictures of whiteboards and documents readable. Office Lens can convert images to editable Word and PowerPoint files too.\nOffice Lens is like having a scanner in your pocket. Like magic, it will digitize notes on whiteboards or blackboards. Always find important documents or business cards. Sketch your ideas and snap a picture for later. Don't lose receipts or stray sticky notes again!",
                             imageFileName: R.image.app_icon_microsoft_lens.name)
        ]
        return [UpdateAppSectionItem(items: rowItems)]
    }
    
    
}

extension UpdateViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionItems.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionItems[section].items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sectionItems[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath) as! UpdateCell
        cell.configure(item: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44*3
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UpdateSectionHeaderView()
        return view
    }
    
}

struct UpdateAppSectionItem {
    var items: [UpdateAppRowItem]
}

extension UpdateAppSectionItem {
    init(original: UpdateAppSectionItem, items: [UpdateAppRowItem]) {
        self = original
        self.items = items
    }
}

struct UpdateAppRowItem {
    let title: String
    let version: String
    let description: String
    let imageFileName: String
}
