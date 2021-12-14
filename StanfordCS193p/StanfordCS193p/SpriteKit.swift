//
//  SpriteKit.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 14/12/2021.
//

import SwiftUI
import SpriteKit

//Game Scene
//SKScene - is an object that organizes all of the active spritekit content
//An SKScene object represents a scene of content in SpriteKit.
//A Scene from SwiftUI is the root note in a tree of SpriteKit nodes(SKNode).

//To display a scene, you represent it from an SKView, SKRenderer, or WKInterfaceSKScene.

//SKScene is a subclass of SKEffectNode and enables certain effects to apply to the entire scene.

//SKPhysicsBody
//An object that adds physics simulation to a node.
//Assign a SKPhysicsBody object to the physics Body property of the SKNode object to add physics
//simulation to the node.

//When a scene processes a new frame, it performs physics calculations on physics bodies attached to nodes in the scene.
//These scene calculation include -gravitiy-, -friction- and -collisions with other bodies.

//Swift guard statement
//Swift uses the -guard statement to transfer program control out of scope when certain conditions are not met.
//The guard statement is similar to the if statement with one major difference. The if statement runs when a certain condition is met, however, the guard statement runs when a certain condition is not met.

/**
 
    guard expression else {
        //statements
        //return or break block
    }
 */

//Here, -expression- returns either true or false. If expression evaluates to;
// 1. True
//  statements inside the code block of guard are not executed.

// 2. False
//  statements inside the code block of -guard are executed.

class GameScence: SKScene {
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        
        let box = SKSpriteNode(color: UIColor.red, size: CGSize(width: 50, height: 50))
        box.position = touchLocation
        
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        
        addChild(box)
    }
}


//SpriteView
//A SwiftUI view that renders a SpriteKit scene

struct SpriteKit: View {
    
    var scene: SKScene {
        let scene = GameScence()
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .fill
        return scene
    }
    
    
    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 300, height: 400)
    }
}

struct SpriteKit_Previews: PreviewProvider {
    static var previews: some View {
        SpriteKit()
    }
}
