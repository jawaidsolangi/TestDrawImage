//
//  DrawImageClass.swift
//  TestDrawImage
//
//  Created by Macbook on 01/11/2018.
//  Copyright © 2018 AMIDTech. All rights reserved.
//
//
//  DrawOnViewController.swift
//
//  Created by Don Mag on 11/7/18.
//

import UIKit

extension NSLayoutConstraint {
    /**
     Change multiplier constraint
     
     - parameter multiplier: CGFloat
     - returns: NSLayoutConstraint
     */
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem as Any,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}

class DrawOnViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // var mainView = UIView()
    
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

    var currentColor : UIColor?
    var myCurrentColor : CGColor?
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let mainView = UIView()
        
        switch row {
        case 0:
            mainView.backgroundColor = UIColor.black
            colorButton.backgroundColor =  UIColor.black
            red = 0; green = 0; blue = 0
        // self.updateColor(.black)
        case 1:
            mainView.backgroundColor = UIColor.white
            colorButton.backgroundColor = UIColor.white
            red = 255.0; green = 255.0; blue = 255.0
        //  self.updateColor(.white)
        case 2:
            mainView.backgroundColor = UIColor.gray
            colorButton.backgroundColor = UIColor.gray
            red = 105.0 / 255.0; green = 105.0 / 255.0; blue = 105.0 / 255.0
        //  self.updateColor(.gray)
        case 3:
            mainView.backgroundColor = UIColor.green
            colorButton.backgroundColor = UIColor.green
        //  self.updateColor(.green)
            red = 76/255.0; green = 217/255.0; blue = 100/255.0
        case 4:
            mainView.backgroundColor = UIColor.red
            colorButton.backgroundColor = UIColor.red
             red = 255.0; green = 0; blue = 0
        // self.updateColor(.red)
        case 5:
            mainView.backgroundColor = UIColor.yellow
            colorButton.backgroundColor = UIColor.yellow
             red = 255.0; green = 255.0; blue = 0
        // self.updateColor(.yellow)
        case 6:
            mainView.backgroundColor = UIColor.purple
            colorButton.backgroundColor = UIColor.purple
             red = 153.0/255.0; green = 51.0/255.0; blue = 255.0/255.0
        // self.updateColor(.purple)
        case 7:
            mainView.backgroundColor = UIColor.orange
            colorButton.backgroundColor = UIColor.orange
             red = 255.0/255.0; green = 153.0/255.0; blue = 51.0/255.0
        // self.updateColor(.orange)
        case 8:
            mainView.backgroundColor = UIColor.blue
            colorButton.backgroundColor = UIColor.blue
             red = 0/255.0; green = 128.0/255.0; blue = 255.0/255.0
        // self.updateColor(.blue)
        case 9:
            mainView.backgroundColor = UIColor.brown
            colorButton.backgroundColor = UIColor.brown
             red = 153/255.0; green = 76/255.0; blue = 0/255.0
        ////self.updateColor(.brown)
        default:
            mainView.backgroundColor = UIColor.magenta
            colorButton.backgroundColor = UIColor.magenta
             red = 0; green = 0; blue = 0
            //     self.updateColor(.magenta)
        }
        
        return mainView
    }
    
    let imageNameIs = "imagescar" //"audi3"
    var lastPoint = CGPoint.zero
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var brushWidth: CGFloat = 5.0 //10.0
    var opacity: CGFloat = 1.0
    var swiped = false


    @IBOutlet weak var tempImageView: UIImageView!
    var tempImageViewtemp : UIImageView = UIImageView()
    
    // ---
    // --- this will hold a reference to the image view's aspect ratio constraint
    @IBOutlet var imageViewAspectRatioConstraint: NSLayoutConstraint!
    
    // ---
    // --- this will be used to allow "brushWidth" to remain
    // --- constant when device is rotated
    var loadedImageHeight: CGFloat = 0.0
    
    // ---
    // --- this will be the "brushWidth" relative to
    // --- to the image's originial height
    var adjustedBrushWidth: CGFloat = 0.0
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var colorButton: UIButton!
    
    @IBAction func resetAct(_ sender: Any) {
        if let img = UIImage(named: imageNameIs) {
            // ---
            // --- reset the imageView's image
            tempImageView.image = img
        }
    }
    
    @IBAction func colorPressed(_ sender: Any) {
        self.selectColorPicker()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorButton.backgroundColor = UIColor.black
        colorButton.layer.borderWidth = 1
        colorButton.layer.borderColor = UIColor.black.cgColor
        
        if let img = UIImage(named: imageNameIs) {
            
            let imgSize = img.size
            
            // ---
            // --- calculate the aspect ratio of the image
            let ratio = imgSize.width / imgSize.height
            
            // ---
            // --- change the image view's aspect ratio to match the image
            imageViewAspectRatioConstraint = imageViewAspectRatioConstraint.setMultiplier(multiplier: ratio)
            
            // ---
            // --- save original image height for brushWidth adjustment
            loadedImageHeight = imgSize.height
            
            // ---
            // --- set the imageView's image
            self.tempImageView.image = img
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // ---
        // --- calculate brushWidth relative to image height scaled to image view height
        adjustedBrushWidth = brushWidth * loadedImageHeight / tempImageView.frame.height
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            // ---
            // --- get point ** in tempImageView **
            lastPoint = touch.location(in: self.tempImageView)
        }
    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        // 1
        
        // ---
        // --- get the bounds of tempImageView
        let rect = tempImageView.bounds
        
        // ---
        // --- use the bounds for the image context size
        UIGraphicsBeginImageContext(rect.size)
        
        let context = UIGraphicsGetCurrentContext()
        
        // ---
        // --- draw the image into the bounds rect
        tempImageView.image?.draw(in: rect)
        
        // 3
        context!.move(to: fromPoint)
        context!.addLine(to: toPoint)
        context!.setLineCap(.round)
        
        // ---
        // --- set line width proportional to current imageView height
        // --- use adjustedBrushWidth set in viewDidAppear
        //      context!.setLineWidth(brushWidth * rect.height / loadedImageHeight)
        context!.setLineWidth(adjustedBrushWidth * rect.height / loadedImageHeight)
        context!.setStrokeColor(red: red, green: green, blue: blue, alpha: 1)
        //context!.setStrokeColor(myCurrentColor!)
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
            
            // ---
            // --- get point ** in tempImageView **
            let currentPoint = touch.location(in: self.tempImageView)
            
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
        
        // ---
        // don't know what you're doing with tempImageViewtemp,
        // but you probably want to change the sizing here to match elsewhere
        //      UIGraphicsBeginImageContext(tempImageViewtemp.frame.size)
        //      tempImageViewtemp.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: .normal, alpha: 1)
        //      tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: .normal, alpha: opacity)
        //      tempImageViewtemp.image = UIGraphicsGetImageFromCurrentImageContext()
        //      UIGraphicsEndImageContext()
    }
}
