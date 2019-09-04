//
//  CIFilterCell.swift
//  CIFilterSample
//
//  Created by BaoBaoDaRen on 2019/9/3.
//  Copyright © 2019 Boris. All rights reserved.
//

import UIKit

class CIFilterCell: UITableViewCell {

    var titLab:UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        showFilterCellSubs()
    }
    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func showFilterCellSubs() {
        
        self.titLab = UILabel.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH - 15, height: 45))
        self.addSubview(self.titLab!)
        self.titLab?.font = UIFont.boldSystemFont(ofSize: 14)
        self.titLab?.textColor = .black
        self.titLab?.textAlignment = .right
    }
    

}
