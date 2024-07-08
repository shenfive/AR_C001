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
        
        let text = SCNText(string: "Hello ARKit", extrusionDepth: 1)
        text.firstMaterial?.diffuse.contents = UIColor.blue
        print(text.font.pointSize)
        print(text.boundingBox)
        let textNode = SCNNode(geometry: text)
        textNode.scale = SCNVector3(0.01, 0.01, 0.01)
        textNode.position = SCNVector3(0, 0, -0.8)
        scene.rootNode.addChildNode(textNode)

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
