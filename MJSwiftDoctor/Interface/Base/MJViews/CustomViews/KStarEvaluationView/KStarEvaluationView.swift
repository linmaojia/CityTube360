//
//  KStarEvaluationView.swift
//  XLCustomer
//
//  Created by longma on 2019/5/13.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

protocol KStarEvaluationViewDelegate: class {
    func didSelectStar(index:Int)
}

class KStarEvaluationView: UIView {
    var numberOfStars:Int = 0
    var fullScore:CGFloat = 0
    var frontView:UIView?
    var backgroundView:UIView?
    weak var delegate:KStarEvaluationViewDelegate?

    init(frame: CGRect , numberOfStars:Int, isVariable:Bool) {
        super.init(frame: frame)
        
        self.numberOfStars = numberOfStars
        self.fullScore = CGFloat(numberOfStars)
        self.loadView()
        if isVariable == true {
            isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapClick))
            addGestureRecognizer(tap) //添加手势
        }
    }
   
    @objc func tapClick(_ tap:UITapGestureRecognizer)
    {
        
        let point: CGPoint = tap.location(in: self)
        let offsetValue: CGFloat = point.x
        var offsetPercent = offsetValue / self.bounds.size.width
        offsetPercent = change(toCompleteStar: offsetPercent)

        actualScore = offsetPercent * fullScore
        
        self.delegate?.didSelectStar(index: Int(actualScore))


    }
    var actualScore : CGFloat!{
        didSet{
            self.setNeedsLayout()
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var scorePercent:CGFloat = CGFloat(self.actualScore/self.fullScore)
        
        scorePercent = self.change(toCompleteStar: scorePercent)

        self.frontView?.frame = CGRect.init(x: 0, y: 0, width: self.bounds.size.width * scorePercent, height: self.bounds.size.height)
        
    }
    func loadView(){
        
        self.actualScore = 1
        self.backgroundView = self.createStarView(withImage: "评分-未选")
        self.frontView = self.createStarView(withImage: "评分-已选")
        self.addSubview(self.backgroundView!)
        self.addSubview(self.frontView!)
    }
    func createStarView(withImage imageName: String?) -> UIView? {
        let view = UIView(frame: bounds)
        view.backgroundColor = UIColor.clear
        view.clipsToBounds = true
        for i in 0..<numberOfStars {
            let imageView = UIImageView(image: UIImage(named: imageName ?? ""))
            imageView.frame = CGRect(x: CGFloat(i) * self.bounds.size.width / CGFloat(numberOfStars), y: 0, width: self.bounds.size.width / CGFloat(numberOfStars), height: self.bounds.size.height)
            imageView.contentMode = .scaleAspectFit
            view.addSubview(imageView)
        }
        return view
    }
    func change(toCompleteStar percent: CGFloat) -> CGFloat {
        var percent = percent
        if percent <= 0.2 {
            percent = 0.2
        } else if percent > 0.2 && percent <= 0.4 {
            percent = 0.4
        } else if percent > 0.4 && percent <= 0.6 {
            percent = 0.6
        } else if percent > 0.6 && percent <= 0.8 {
            percent = 0.8
        } else {
            percent = 1.0
        }
        return percent
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
