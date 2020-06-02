//
//  GameScene.swift
//  IntroToSpriteKit
//
//  Created by Russell Gordon on 2019-12-07.
//  Copyright © 2019 Russell Gordon. All rights reserved.
//
//
import SpriteKit
import GameplayKit
import AVFoundation



class GameScene: SKScene {
   
    
    // Background music player
    var backgroundMusic: AVAudioPlayer?
   
    //Setting the player image
    let player = SKSpriteNode(imageNamed: "Sunfire")
    
    // This function runs once to set up the scene
    override func didMove(to view: SKView) {
      
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
       
        //Addingplayer
        player.physicsBody = SKPhysicsBody(texture: player.texture!,
        alphaThreshold: 0.5,
        size: player.size)
        
        player.position.x = 200
        player.position.y = 200
        player.zPosition = 1
        player.physicsBody?.affectedByGravity = false
        
        let size = SKAction.scale(to: 0.75, duration: 0.1)
        player.run(size)
        
        self.addChild(player)
        
        //Adding Background
        let background = SKSpriteNode(imageNamed: "space")
        background.position = CGPoint(x: 300, y: 280)

        background.physicsBody?.affectedByGravity = false

        self.addChild(background)
        
        //Adding the fire ball to the game
        let fire = SKSpriteNode(imageNamed: "fire1")
        fire.position = CGPoint(x: 250, y: 200)
        fire.physicsBody = SKPhysicsBody(texture: fire.texture!,
                                         alphaThreshold: 0.5,
                                         size: fire.size)
        fire.physicsBody?.affectedByGravity = false
        self.addChild(fire)

        var fireTextures: [SKTexture] = []
        
        fireTextures.append(SKTexture(imageNamed: "fire1"))
        fireTextures.append(SKTexture(imageNamed: "fire2"))
        fireTextures.append(SKTexture(imageNamed: "fire3"))
        fireTextures.append(SKTexture(imageNamed: "fire4"))
        fireTextures.append(SKTexture(imageNamed: "fire5"))
        fireTextures.append(SKTexture(imageNamed: "fire6"))
        fireTextures.append(SKTexture(imageNamed: "fire7"))
        
        
        let fireFlyingAnimation = SKAction.animate(with: fireTextures, timePerFrame: 0.2, resize: true, restore: true)
        
        let actionShoot = SKAction.moveBy(x: 500, y: 0, duration: 2)
        
        let fireShoot = SKAction.group ([actionShoot, fireFlyingAnimation])
        
//        // Get a reference to the mp3 file in the app bundle
//        let backgroundMusicFilePath = Bundle.main.path(forResource: "sleigh-bells-excerpt.mp3", ofType: nil)!
//
//        // Convert the file path string to a URL (Uniform Resource Locator)
//        let backgroundMusicFileURL = URL(fileURLWithPath: backgroundMusicFilePath)
//
//        // Attempt to open and play the file at the given URL
//        do {
//            backgroundMusic = try AVAudioPlayer(contentsOf: backgroundMusicFileURL)
//            backgroundMusic?.play()
//        } catch {
//            // Do nothing if the sound file could not be played
//        }
        let moveLeft = SKAction.moveBy(x: -20, y: 0, duration: 0.1)
        let moveright = SKAction.moveBy(x: 20, y: 0, duration: 0.1)
        
    }
 
    
   
     // This runs before each frame is rendered
     // Avoid putting computationally intense code in this function to maintain high performance
     override func update(_ currentTime: TimeInterval) {
         // Called before each frame is rendered
     }
    
    override func keyDown(with event: NSEvent) {
        
         let fire = SKSpriteNode(imageNamed: "fire1")
        var fireTextures: [SKTexture] = []
        
        fireTextures.append(SKTexture(imageNamed: "fire1"))
        fireTextures.append(SKTexture(imageNamed: "fire2"))
        fireTextures.append(SKTexture(imageNamed: "fire3"))
        fireTextures.append(SKTexture(imageNamed: "fire4"))
        fireTextures.append(SKTexture(imageNamed: "fire5"))
        fireTextures.append(SKTexture(imageNamed: "fire6"))
        fireTextures.append(SKTexture(imageNamed: "fire7"))
        
        
        let fireFlyingAnimation = SKAction.animate(with: fireTextures, timePerFrame: 0.2, resize: true, restore: true)
        
        let actionShoot = SKAction.moveBy(x: 500, y: 0, duration: 2)
        
        let fireShoot = SKAction.group ([actionShoot, fireFlyingAnimation])
        
      //ignore repeted key presses.
       guard !event.isARepeat else { return }
        
        
        // obtain the key that's been pressed
    let keyCode: UInt16 = event.keyCode
       print("keyCode = \(keyCode)")
       
        // respond to different keys
        switch keyCode {
        case 125:
            print("Down Arrow Key pressed")
        case 124:
             print("Right Arrow Key pressed")
            
        case 123:
             print("left Arrow Key pressed")
        case 126:
             print("up Arrow Key pressed")
        case 49:
            fire.run(fireShoot)
        default:
            break
        }
    }
    
}
