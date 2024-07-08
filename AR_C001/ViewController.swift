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

        let material1 = SCNMaterial()
        material1.diffuse.contents = UIColor.red
        let material2 = SCNMaterial()
        material2.diffuse.contents = UIColor.orange
        let material3 = SCNMaterial()
        material3.diffuse.contents = UIColor.yellow
        let material4 = SCNMaterial()
        material4.diffuse.contents = UIColor.green
        let material5 = SCNMaterial()
        material5.diffuse.contents = UIColor.blue
        let material6 = SCNMaterial()
        material6.diffuse.contents = UIColor.purple
        box.materials = [material1, material2, material3, material4, material5, material6]
        
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
