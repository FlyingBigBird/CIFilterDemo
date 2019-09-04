//
//  CIFIlterView.swift
//  CIFilterSample
//
//  Created by BaoBaoDaRen on 2019/9/3.
//  Copyright © 2019 Boris. All rights reserved.
//

import UIKit

typealias doPushBlock = (_ filterType:CIFilterType) -> Void

class CIFIlterView: UIView, UITableViewDataSource, UITableViewDelegate{

    let cellRes:String = "filterCellId"
    var selectCellType:doPushBlock?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        showFilterUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func showFilterUI() {
        
        self.table.tableHeaderView = UIView()
        self.table.tableFooterView = UIView()
        self.table.dataSource = self;
        self.table.delegate = self
        self.addSubview(self.table)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:CIFilterCell! = tableView.dequeueReusableCell(withIdentifier: cellRes) as? CIFilterCell
        if cell == nil {
            
            cell = CIFilterCell.init(style: .default, reuseIdentifier: cellRes)
        }
        if indexPath.row == 0 {
            
            cell.titLab?.text = "图片渲染  ➡️"
        } else {
            cell.titLab?.text = "视频渲染  ➡️"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 点击...
        switch indexPath.row {
        case 0:
            selectCellType!(.image)
        case 1:
            selectCellType!(.video)

        default:
            print("click row :\(indexPath.row)")
        }
    }
    
    public func filterWithType(clickBlock:@escaping doPushBlock) {
        
        selectCellType = clickBlock
    }
    
    public lazy var table:UITableView = {
        
        let tableV = UITableView.init(frame: self.bounds, style: .plain)
        tableV .register(CIFilterCell.classForCoder(), forCellReuseIdentifier: cellRes)
        return tableV
    }()
}
