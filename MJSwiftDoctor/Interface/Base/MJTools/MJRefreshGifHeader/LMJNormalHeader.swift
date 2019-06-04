//
//  LMJNormalHeader.swift
//  XLCustomer
//
//  Created by longma on 2019/1/7.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class LMJNormalHeader: MJRefreshNormalHeader {
    
    //重写父类的方法
    override func prepare() {
        super.prepare()
        setTitle("  下拉即可刷新...", for: .idle)
        setTitle("  释放即可刷新...", for: .pulling)
        setTitle("  加载中...", for: .refreshing)
        
        // 设置颜色
        stateLabel.textColor = UIColor.MJTheme.black
        
        lastUpdatedTimeLabel.isHidden = true
    }

}
