//
//  CameraViewController.swift
//  iOSSwiftSimpleAVCamera
//
//  Created by Bradley Griffith on 7/1/14.
//  Copyright (c) 2014 Bradley Griffith. All rights reserved.
//


import UIKit
import CoreMedia
import AVFoundation

class CameraViewController: UIViewController, CameraSessionControllerDelegate {
	
	var cameraSessionController: CameraSessionController!
	var previewLayer: AVCaptureVideoPreviewLayer!
	
	
	/* Lifecycle
	------------------------------------------*/
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.cameraSessionController = CameraSessionController()
		self.cameraSessionController.sessionDelegate = self
		self.setupPreviewLayer()
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		self.cameraSessionController.startCamera()
	}
	
	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		
		self.cameraSessionController.teardownCamera()
	}
	
	
	/* Instance Methods
	------------------------------------------*/
	
	func setupPreviewLayer() {
		var minSize: Float = min(self.view.bounds.size.width, self.view.bounds.size.height)
		var bounds: CGRect = CGRectMake(0.0, 0.0, minSize, minSize)
		self.previewLayer = AVCaptureVideoPreviewLayer(session: self.cameraSessionController.session)
		self.previewLayer.bounds = bounds
		self.previewLayer.position = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds))
		self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
		
		self.view.layer.addSublayer(self.previewLayer)
	}
	
	func cameraSessionDidOutputSampleBuffer(sampleBuffer: CMSampleBuffer!) {
		// Any frame processing could be done here.
	}
	
}