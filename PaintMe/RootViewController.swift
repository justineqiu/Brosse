//
//  RootViewController.swift
//  PaintMe
//
//  Created by Skylar Poulos on 8/1/17.
//  Copyright © 2017 Skylar Poulos. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    
    
    @IBOutlet weak var ImageView: UIImageView!
    
    
    
    @IBAction func next(_ sender: AnyObject) {
        let beginImage = CIImage(image:ImageView!.image!)
        if let filter = CIFilter(name:"CISepiaTone"){
            filter.setValue(beginImage, forKey:kCIInputImageKey)
            let outputImage = filter.outputImage!
            let newImage = UIImage(ciImage: outputImage)
            ImageView!.image = newImage
        }
        
    }
    
    @IBAction func chooseImage(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: . actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }else{
                print("Camera not available")
            }
            
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
            
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        ImageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
    
}
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
}


