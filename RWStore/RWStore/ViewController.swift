//
//  ViewController.swift
//  RWStore
//
//  Created by Tamanna on 16/10/23.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var productsButton: NSPopUpButton!
    
    private var products = [Product]()
    var selectedProduct: Product?
    
    private var overviewViewController: OverviewController?
    private var detailViewController: DetailViewController?

    @IBAction func valueChanged(_ sender: NSPopUpButton) {
        
        detailViewController?.selectedProduct = selectedProduct

        if let bookTitle = sender.selectedItem?.title,
           let index = products.firstIndex(where: {$0.title == bookTitle})
        {
            selectedProduct = products[index]
            overviewViewController?.selectedProduct = selectedProduct
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let filePath = Bundle.main.path(forResource: "Products", ofType: "plist") {
          products = Product.productsList(filePath)
        }
        
        productsButton.removeAllItems()
        for product in products{
            productsButton.addItem(withTitle: product.title)
        }
        
        selectedProduct = products[0]
        productsButton.selectItem(at: 0)


    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
      guard let tabViewController = segue.destinationController
        as? NSTabViewController else { return }

        for controller in tabViewController.children {

        if let controller = controller as? OverviewController {
          overviewViewController = controller
          overviewViewController?.selectedProduct = selectedProduct
        }
        else if let controller = controller as? DetailViewController
        {
            detailViewController = controller
            detailViewController?.selectedProduct = selectedProduct
        }
      }
    }


    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

