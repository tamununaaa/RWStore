//
//  DetailViewController.swift
//  RWStore
//
//  Created by Tamanna on 17/10/23.
//

import Cocoa

class DetailViewController: NSViewController {

    @IBOutlet weak var productImageView: NSImageView!
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var descriptionLabel: NSTextField!
    @IBOutlet weak var audienceLabel: NSTextField!
    
    var selectedProduct: Product?
    {
        didSet
        {
            updateUI()
        }
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        updateUI()
    }
    
    private func updateUI()
    {
        if isViewLoaded{
            if let product = selectedProduct
            {
                productImageView.image = product.image
                titleLabel.stringValue = product.title
                descriptionLabel.stringValue = product.descriptionText
                audienceLabel.stringValue = product.audience
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
