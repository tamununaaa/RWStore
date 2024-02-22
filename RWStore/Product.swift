
import AppKit

struct Product {

  let title: String
  let audience: String
  let descriptionText: String
  let price: NSNumber
  var image: NSImage? {
    get {
      let i = NSImage(named: imageName)

      return i
    }
  }

  fileprivate let imageName: String

  static func productsList(_ fileName: String) -> [Product] {
    var products = [Product]()

    if let productList = NSArray(contentsOfFile: fileName) as? [[String: Any]] {
      for dict in productList {
        if let product = Product(dictionary: dict) {
          products.append(product)
        }
      }
    }

    return products
  }

  init?(dictionary: [String: Any]) {
    guard let title = dictionary["Name"] as? String,
      let audience = dictionary["Audience"] as? String,
      let descriptionText = dictionary["Description"] as? String,
      let price = dictionary["Price"] as? NSNumber,
      let imageName = dictionary["Imagename"] as? String else {
        return nil
    }

    self.title = title
    self.audience = audience
    self.descriptionText = descriptionText
    self.price = price
    self.imageName = imageName
  }

}
