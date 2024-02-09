import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var descriptionLabel: UILabel!
    
    let imagePicker = UIImagePickerController()
    let wikipediaURL = "https://en.wikipedia.org/w/api.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        print("Welcome")
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = userPickedImage
            
            guard let ciimage = CIImage(image: userPickedImage) else {
                fatalError("Could not convert to CIImage")
            }
            
            imageView.image = userPickedImage
            
            
            detect(image: ciimage)
        }
        
        
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    func detect(image: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Loading CoreML model failed")
        }
        
        let request = VNCoreMLRequest(model: model) { request, error in
            guard let result = request.results?.first as? VNClassificationObservation else {
                fatalError("Model failed to process image")
            }
            
            // Split the identifier string by commas and trim the first label
                let labels = result.identifier.split(separator: ",")
                var flowerName = "Don't know" // Default value
                
                if let firstLabel = labels.first {
                    let trimmedLabel = String(firstLabel).trimmingCharacters(in: .whitespaces)
                    self.navigationItem.title = trimmedLabel
                    flowerName = trimmedLabel // Use the trimmed label as the flower name
                } else {
                    self.navigationItem.title = flowerName
                }
                
                // Now pass the trimmed first label to requestInfo
                self.requestInfo(flowerName: flowerName)
            
            
            
        }
        // Don't forget to execute the request with a VNImageRequestHandler
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        } catch {
            print("Failed to perform classification.\n\(error.localizedDescription)")
        }
    }

    


    @IBAction func cameraPressed(_ sender: UIBarButtonItem) {

        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    func requestInfo(flowerName: String) {
        
        let parameters : [String: String] = [
        "format" : "json",
        "action" : "query",
        "prop" : "extracts|pageimages",
        "exintro" : "",
        "explaintext" : "",
        "titles" : flowerName,
        "indexpageids" : "",
        "redirects" : "1",
        "pithumbsize": "500",
        ]
        
        
        
        AF.request(wikipediaURL, parameters: parameters).responseJSON { (response) in
            
print(response)
            let objectJSON = JSON(response.value!)
            

            
            let pageid = objectJSON["query"]["pageids"][0].stringValue

            
            let objectDescription = objectJSON["query"]["pages"][pageid]["extract"].stringValue
            
            let objectImageURL = objectJSON["query"]["pages"][pageid]["thumbnail"]["source"].stringValue
            
            
            self.imageView.sd_setImage(with: URL(string: objectImageURL))
            self.descriptionLabel.text = objectDescription
        }
    }
    
    
    
    
    
    
}
