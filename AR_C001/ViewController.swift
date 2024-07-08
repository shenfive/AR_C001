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
        
        let sphere = SCNSphere(radius: 0.15)
        sphere.materials.first?.diffuse.contents = UIImage(named: "worldmap")
        let sphereNode = SCNNode(geometry: sphere)
        sphereNode.position = SCNVector3(x: 0, y: 0, z: -0.5)
        scene.rootNode.addChildNode(sphereNode)
        
        let box = SCNBox(width: 0.3, height: 0.3, length: 0.3, chamferRadius: 0)
        box.materials.first?.diffuse.contents = UIImage(named: "worldmap")
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3(x: 0.5, y: 0, z: -0.5)
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
