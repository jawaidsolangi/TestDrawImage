//
//  NewViewController.swift
//  TestDrawImage
//
//  Created by Macbook on 07/11/2018.
//  Copyright © 2018 AMIDTech. All rights reserved.
//
    import UIKit
    import CoreImage
//    extension UIView {
//        // return content of view as a UIImage
//        // can be used to get a copy of the rendered image view
//        // e.g. the result of scaling setting
//
//        func asImage() -> UIImage {
//            let renderer = UIGraphicsImageRenderer(bounds: bounds)
//            return renderer.image { rendererContext in
//                layer.render(in: rendererContext.cgContext)
//            }
//        }
//
//    }

    class NewViewController: UIViewController {
        
//        let imageNameIs = "BradPitImage"
//        var lastPoint = CGPoint.zero
//        var red: CGFloat = 0.0
//        var green: CGFloat = 0.0
//        var blue: CGFloat = 0.0
//        var brushWidth: CGFloat = 10.0
//        var opacity: CGFloat = 1.0
//        var swiped = false
//        
//        @IBOutlet weak var tempImageView: UIImageView!
//        var tempImageViewtemp : UIImageView = UIImageView()
//        
//        // ---
//        // --- this will hold a copy of the resized image (for reset)
//        var resizedImage: UIImage!
//        
//        @IBOutlet weak var resetButton: UIButton!
//        @IBOutlet weak var saveButton: UIButton!
//        
//        @IBAction func resetAct(_ sender: Any) {
//            // ---
//            // --- reset using the resized image from viewDidAppear
//            tempImageView.image = resizedImage
//        }
//        
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            self.tempImageView.image = UIImage(named: imageNameIs)
//        }
//        
//        override func viewDidAppear(_ animated: Bool) {
//            super.viewDidAppear(animated)
//            
//            // ---
//            // --- create a resized copy of the original image
//            // --- (handles aspect fit scale)
//            resizedImage = tempImageView.asImage()
//            tempImageView.image = resizedImage
//            
//        }
//        
//        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//            swiped = false
//            if let touch = touches.first {
//                // ---
//                // --- get point ** in tempImageView **
//                lastPoint = touch.location(in: self.tempImageView)  //view)
//            }
//        }
//        
//        func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
//            // 1
//            
//            // ---
//            // --- get the bounds of tempImageView
//            let rect = tempImageView.bounds
//            
//            // ---
//            // --- use the bounds for the image context size
//            UIGraphicsBeginImageContext(rect.size)
//            
//            let context = UIGraphicsGetCurrentContext()
//            
//            // ---
//            // --- draw the image into the bounds rect
//            tempImageView.image?.draw(in: rect)
//            
//            // 3
//            context!.move(to: fromPoint)
//            context!.addLine(to: toPoint)
//            context!.setLineCap(.round)
//            context!.setLineWidth(brushWidth)
//            context!.setStrokeColor(red: red, green: green, blue: blue, alpha: 1)
//            context!.setBlendMode(.normal)
//            
//            // 4
//            context!.strokePath()
//            //CGContextStrokePath(context!)
//            
//            // 5
//            tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
//            tempImageView.alpha = opacity
//            UIGraphicsEndImageContext()
//        }
//        
//        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//            swiped = true
//            if let touch = touches.first {
//                
//                // ---
//                // --- get point ** in tempImageView **
//                let currentPoint = touch.location(in: self.tempImageView)
//                
//                drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
//                
//                // 7
//                lastPoint = currentPoint
//            }
//        }
//        
//        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//            if !swiped {
//                //draw a single point
//                drawLineFrom(fromPoint: lastPoint, toPoint: lastPoint)
//            }
//            
//            // ---
//            // don't know what you're doing with tempImageViewtemp,
//            // but you probably want to change the sizing here to match elsewhere
//            UIGraphicsBeginImageContext(tempImageViewtemp.frame.size)
//            tempImageViewtemp.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: .normal, alpha: 1)
//            tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: .normal, alpha: opacity)
//            tempImageViewtemp.image = UIGraphicsGetImageFromCurrentImageContext()
//            UIGraphicsEndImageContext()
//        }
}


/*
 
 //
 //  ViewController.swift
 //  TestDrawImage
 //
 //  Created by Macbook on 26/10/2018.
 //  Copyright © 2018 AMIDTech. All rights reserved.
 //
 
 import UIKit
 import CoreImage
 
 class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 
 var mainView = UIView()
 
 func numberOfComponents(in pickerView: UIPickerView) -> Int {
 return 1
 }
 
 func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
 return 10
 }
 //    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
 //    {
 //        let view = UIView()
 //        let label = UILabel()
 //        label.backgroundColor =
 //        view.addSubview(label)
 //        //adjust frame rect's here to make sure it's actually visible
 //        return view
 //    }
 func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
 //let mainView = UIView()
 
 switch row {
 case 0:
 mainView.backgroundColor = UIColor.black
 colorButton.backgroundColor =  UIColor.black
 // self.updateColor(.black)
 case 1:
 mainView.backgroundColor = UIColor.white
 colorButton.backgroundColor = UIColor.white
 //  self.updateColor(.white)
 case 2:
 mainView.backgroundColor = UIColor.gray
 colorButton.backgroundColor = UIColor.gray
 //  self.updateColor(.gray)
 case 3:
 mainView.backgroundColor = UIColor.green
 colorButton.backgroundColor = UIColor.green
 //  self.updateColor(.green)
 case 4:
 mainView.backgroundColor = UIColor.red
 colorButton.backgroundColor = UIColor.red
 // self.updateColor(.red)
 case 5:
 mainView.backgroundColor = UIColor.yellow
 colorButton.backgroundColor = UIColor.yellow
 // self.updateColor(.yellow)
 case 6:
 mainView.backgroundColor = UIColor.purple
 colorButton.backgroundColor = UIColor.purple
 // self.updateColor(.purple)
 case 7:
 mainView.backgroundColor = UIColor.orange
 colorButton.backgroundColor = UIColor.orange
 // self.updateColor(.orange)
 case 8:
 mainView.backgroundColor = UIColor.blue
 colorButton.backgroundColor = UIColor.blue
 // self.updateColor(.blue)
 case 9:
 mainView.backgroundColor = UIColor.brown
 colorButton.backgroundColor = UIColor.brown
 ////self.updateColor(.brown)
 default:
 mainView.backgroundColor = UIColor.magenta
 colorButton.backgroundColor = UIColor.magenta
 //     self.updateColor(.magenta)
 }
 
 return mainView
 }
 
 //    func updateColor(_ selectedColor : UIColor) { // -> UIColor {
 //        mainView.backgroundColor = selectedColor
 //        colorButton.backgroundColor = selectedColor
 //        //return selectedColor
 //    }
 
 var ColorNumber = Int()
 let imageNameIs = "imagesok"
 var lastPoint = CGPoint.zero
 var red: CGFloat = 0.0
 var green: CGFloat = 0.0
 var blue: CGFloat = 0.0
 var brushWidth: CGFloat = 10.0
 var opacity: CGFloat = 1.0
 var swiped = false
 
 @IBOutlet weak var tempImageView: UIImageView!
 var tempImageViewtemp : UIImageView = UIImageView()
 
 @IBOutlet weak var resetButton: UIButton!
 @IBOutlet weak var saveButton: UIButton!
 
 @IBOutlet weak var colorButton: UIButton!
 @IBAction func resetAct(_ sender: Any) {
 tempImageView.image = nil
 tempImageView.image = UIImage(named: imageNameIs)
 }
 
 @IBAction func colorPressed(_ sender: UIButton) {
 self.selectColorPicker()
 //        // 1
 //        var index = sender.tag //?? 0
 //        if index < 0 || index >= colors.count {
 //            index = 0
 //        }
 //
 //        // 2
 //        (red, green, blue) = colors[index]
 //
 //        // 3
 //        if index == colors.count - 1 {
 //            opacity = 1.0
 //        }
 
 }
 
 
 let colors: [(CGFloat, CGFloat, CGFloat)] = [
 (0, 0, 0),
 (105.0 / 255.0, 105.0 / 255.0, 105.0 / 255.0),
 (1.0, 0, 0),
 (0, 0, 1.0),
 (51.0 / 255.0, 204.0 / 255.0, 1.0),
 (102.0 / 255.0, 204.0 / 255.0, 0),
 (102.0 / 255.0, 1.0, 0),
 (160.0 / 255.0, 82.0 / 255.0, 45.0 / 255.0),
 (1.0, 102.0 / 255.0, 0),
 (1.0, 1.0, 0),
 (1.0, 1.0, 1.0),
 ]
 
 
 override func viewDidLoad() {
 super.viewDidLoad()
 self.tempImageView.image = UIImage(named: imageNameIs)
 ColorNumber = 0
 colorButton.layer.borderWidth = 1
 colorButton.layer.borderColor = UIColor.black.cgColor
 }
 
 func selectColorPicker() {
 let vc = UIViewController()
 vc.preferredContentSize = CGSize(width: 250,height: 300)
 let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
 pickerView.delegate = self
 pickerView.dataSource = self
 
 vc.view.addSubview(pickerView)
 let editRadiusAlert = UIAlertController(title: "Choose color", message: nil, preferredStyle: .alert)
 editRadiusAlert.setValue(vc, forKey: "contentViewController")
 editRadiusAlert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
 editRadiusAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
 self.present(editRadiusAlert, animated: true)
 }
 
 
 override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
 swiped = false
 if let touch = touches.first {
 lastPoint = touch.location(in: tempImageView)//view)
 }
 }
 
 func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
 // 1
 UIGraphicsBeginImageContext(tempImageView.frame.size) //(view.frame.size) makes lines coluored of image
 let context = UIGraphicsGetCurrentContext()
 tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: tempImageView.frame.size.width, height: tempImageView.frame.size.height))
 
 // 3
 context!.move(to: fromPoint)
 context!.addLine(to: toPoint)
 context!.setLineCap(.round)
 context!.setLineWidth(brushWidth)
 context!.setStrokeColor(red: red, green: green, blue: blue, alpha: 1)
 context!.setBlendMode(.normal)
 
 // 4
 context!.strokePath()
 //CGContextStrokePath(context!)
 
 // 5
 tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
 tempImageView.alpha = opacity
 UIGraphicsEndImageContext()
 }
 
 override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
 swiped = true
 if let touch = touches.first {
 let currentPoint = touch.location(in: tempImageView)//view)
 drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
 // 7
 lastPoint = currentPoint
 }
 }
 
 func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
 // 6
 swiped = true
 if let touch = touches.first as? UITouch {
 let currentPoint = touch.location(in: view)
 drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
 // 7
 lastPoint = currentPoint
 }
 }
 
 override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
 if !swiped {
 //draw a single point
 drawLineFrom(fromPoint: lastPoint, toPoint: lastPoint)
 }
 UIGraphicsBeginImageContext(tempImageViewtemp.frame.size)
 tempImageViewtemp.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: .normal, alpha: 1)
 tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: .normal, alpha: opacity)
 tempImageViewtemp.image = UIGraphicsGetImageFromCurrentImageContext()
 UIGraphicsEndImageContext()
 //tempImageView.image = nil
 }
 
 }
 

 */
