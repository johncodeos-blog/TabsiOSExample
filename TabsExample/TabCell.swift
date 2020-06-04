//
//  TabCell.swift
//  TabsExample
//
//  Created by John Codeos on 5/22/20.
//  Copyright © 2020 John Codeos. All rights reserved.
//

import UIKit

class TabCell: UICollectionViewCell {
    private var tabSV: UIStackView!
    
    var tabTitle: UILabel!
    
    var tabIcon: UIImageView!
    
    var indicatorView: UIView!
    
    var indicatorColor: UIColor = .black
    
    override var isSelected: Bool {
        didSet {
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.3) {
                    self.indicatorView.backgroundColor = self.isSelected ? self.indicatorColor : UIColor.clear
                    self.layoutIfNeeded()
                }
            }
        }
    }
    
    var tabViewModel: Tab? {
        didSet {
            tabTitle.text = tabViewModel?.title
            tabIcon.image = tabViewModel?.icon
            
            // Remove stackView spacing if icon is nil
            (tabViewModel?.icon != nil) ? (tabSV.spacing = 10) : (tabSV.spacing = 0)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tabSV = UIStackView()
        tabSV.axis = .horizontal
        tabSV.distribution = .equalCentering
        tabSV.alignment = .center
        tabSV.spacing = 10.0
        addSubview(tabSV)
        
        // Tab Icon
        tabIcon = UIImageView()
        tabIcon.clipsToBounds = true
        self.tabSV.addArrangedSubview(tabIcon)
        
        // Tab Title
        tabTitle = UILabel()
        tabTitle.textAlignment = .center
        self.tabSV.addArrangedSubview(tabTitle)
        
        // TabIcon Constaints
        tabIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tabIcon.heightAnchor.constraint(equalToConstant: 18),
            self.tabIcon.widthAnchor.constraint(lessThanOrEqualToConstant: 18)
        ])
        
        // TabSv Constraints
        tabSV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabSV.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tabSV.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        setupIndicatorView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        tabTitle.text = ""
        tabIcon.image = nil
    }
    
    func setupIndicatorView() {
        indicatorView = UIView()
        addSubview(indicatorView)
        
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicatorView.heightAnchor.constraint(equalToConstant: 3),
            indicatorView.widthAnchor.constraint(equalTo: self.widthAnchor),
            indicatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
