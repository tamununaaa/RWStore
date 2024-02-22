//
//  OverviewController.swift
//  RWStore
//
//  Created by Tamanna on 16/10/23.
//

import Cocoa

class OverviewController: NSViewController {

    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var priceLabel: NSTextField!
    @IBOutlet weak var descriptionLabel: NSTextField!
    @IBOutlet weak var productImageView: NSImageView!
    
    let numberFormatter = NumberFormatter()
    var selectedProduct:Product? {
        didSet{
            updateUI()
        }
    }
    
    private func updateUI()
    {
        if isViewLoaded
        {
            if let product = selectedProduct
            {
                productImageView.image = product.image
                titleLabel.stringValue = product.title
                priceLabel.stringValue = numberFormatter.string(from: product.price) ?? "N/A"
                descriptionLabel.stringValue = product.descriptionText
            }
        }
    }
    
    override func viewWillAppear() {
      super.viewWillAppear()
      updateUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        numberFormatter.numberStyle = .currency
        // Do view setup here.
    }
    
}
