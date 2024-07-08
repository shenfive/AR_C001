//
//  ViewController.swift
//  AR_C001
//
//  Created by 申潤五 on 2024/7/8.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        
        sceneView.debugOptions = [ .showWorldOrigin,.showFeaturePoints ]
        let scene = SCNScene()
        
        
        let box = SCNBox(width: 0.2, height: 0.2 , length: 0.2 , chamferRadius: 0)

        let material = SCNMaterial()
        material.diffuse.contents = UIColor.red
        box.materials = [material]
        
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3(0,0,-1)
        scene.rootNode.addChildNode(boxNode)

        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
}
