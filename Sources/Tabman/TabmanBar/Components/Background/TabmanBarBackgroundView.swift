//
//  TabmanBarBackgroundView.swift
//  Tabman
//
//  Created by Merrick Sapsford on 22/02/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import UIKit
import PureLayout

/// View that displays background styles for a TabmanBar.
public class TabmanBarBackgroundView: UIView {
    
    //
    // MARK: Types
    //
    
    public enum BackgroundStyle {
        case none
        case blur(style: UIBlurEffectStyle)
        case solid(color: UIColor)
    }
    
    //
    // MARK: Properties
    //
    
    var backgroundStyle: BackgroundStyle = TabmanBar.Appearance.defaultAppearance.backgroundStyle ?? .none {
        didSet {
            self.updateBackground(forStyle: backgroundStyle)
        }
    }
    
    private lazy var backgroundContainer = UIView()
    
    //
    // MARK: Init
    //
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initBackgroundView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initBackgroundView()
    }
    
    private func initBackgroundView() {
        self.addSubview(self.backgroundContainer)
        self.backgroundContainer.autoPinEdgesToSuperviewEdges()
        
        self.updateBackground(forStyle: backgroundStyle)
    }
    
    //
    // MARK: Lifecycle
    //
    
    func updateBackground(forStyle style: BackgroundStyle) {
        self.backgroundContainer.removeAllSubviews()

        switch style {
        
        case .blur(let style):
            let blurView = UIVisualEffectView(effect: UIBlurEffect(style: style))
            self.backgroundContainer.addSubview(blurView)
            blurView.autoPinEdgesToSuperviewEdges()
            
        case .solid(let color):
            let colorView = UIView()
            colorView.backgroundColor = color
            self.backgroundContainer.addSubview(colorView)
            colorView.autoPinEdgesToSuperviewEdges()
            
        default:()
        }
    }
}
