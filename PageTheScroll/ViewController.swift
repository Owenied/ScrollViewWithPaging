//
//  ViewController.swift
//  PageTheScroll
//
//  Created by Owen Duignan on 02/05/2017.
//  Copyright © 2017 Owen Duignan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Create ScrollView
    @IBOutlet weak var scrollView: UIScrollView!
    
    // Add array of images
    var images = [UIImageView]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // Add content width variable
        var contentWidth: CGFloat = 0.0
        
        print("ScrollView width: \(scrollView.frame.size.width)")
        
        // Add variable to make use of scroll width easier for use (i.e. save on typing)
        let scrollWidth = scrollView.frame.size.width
        
        // Loop to add images to the scrollView
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            // Add page scrollViews
            var newX: CGFloat = 0.0
            
            // Makes it look like there are pages for each image when scrolled left / right
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            
            contentWidth += newX
            
            // Add the image to the scrollView
            scrollView.addSubview(imageView)
            
            // Positioning of the image on screen
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        
        // Allows the next image to be shown
        scrollView.clipsToBounds = false
        
        // Size dimensions of the scrollView on the screen
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
    }
    
}

