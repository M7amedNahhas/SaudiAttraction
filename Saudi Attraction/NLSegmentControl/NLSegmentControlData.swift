//
//  NLSegmentControlData.swift
//  NLSegmentControlExample
//
//  Created by songhailiang on 10/07/2017.
//  Copyright © 2017 hailiang.song. All rights reserved.
//

import UIKit

/// datasource protocol of segment control.
public protocol NLSegment {
    var segmentTitle: String? { get }
    var segmentImage: UIImage? { get }
    var segmentSelectedImage: UIImage? { get }
    
}

/// default implements of NLSegment
public extension NLSegment {
    var segmentTitle: String? {
        return nil
    }
    var segmentImage: UIImage? {
        return nil
    }
    var segmentSelectedImage: UIImage? {
        return nil
    }
}

/// e.g. segmentControl.segments = [NLUISegmentItem]
public struct NLSegmentItem {
    public var title: String?
    public var image: UIImage?
    public var selectedImage: UIImage?
    
    public init(title: String? = nil, image: UIImage? = nil, selectedImage: UIImage? = nil) {
        self.title = title
        self.image = image
        self.selectedImage = selectedImage
    }
}

extension NLSegmentItem: NLSegment {
    public var segmentTitle: String? {
        return title
    }
    public var segmentImage: UIImage? {
        return image
    }
    public var segmentSelectedImage: UIImage? {
        return selectedImage
    }
}
