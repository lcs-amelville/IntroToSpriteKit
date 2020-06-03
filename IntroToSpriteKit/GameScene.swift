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
    let fire = SKSpriteNode(imageNamed: "fire1")
    let background = SKSpriteNode(imageNamed: "space")
    let fireRing = SKSpriteNode(imageNamed: "fireRing")
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
       
        background.position = CGPoint(x: 300, y: 280)

        background.physicsBody?.affectedByGravity = false

        self.addChild(background)
        
        //Adding the fire ball to the game
        
        fire.position = CGPoint(x: 250, y: 200)
        fire.physicsBody = SKPhysicsBody(texture: fire.texture!,
                                         alphaThreshold: 0.5,
                                         size: fire.size)
        fire.physicsBody?.affectedByGravity = false
        self.addChild(fire)

        fireRing.position = CGPoint(x: -100, y: 200)
        fireRing.physicsBody = SKPhysicsBody(texture: fireRing.texture!,
        alphaThreshold: 1,
        size: fireRing.size)
        fireRing.physicsBody?.affectedByGravity = false
        self.addChild(fireRing)
        
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
        //let moveLeft = SKAction.moveBy(x: -20, y: 0, duration: 0.1)
        //let moveright = SKAction.moveBy(x: 20, y: 0, duration: 0.1)
        
    }
 
    
   
     // This runs before each frame is rendered
     // Avoid putting computationally intense code in this function to maintain high performance
     override func update(_ currentTime: TimeInterval) {
         // Called before each frame is rendered
     }
    
    override func keyDown(with event: NSEvent) {
        
        //For Fireball switching textures
        var fireTextures: [SKTexture] = []
        
        fireTextures.append(SKTexture(imageNamed: "fire1"))
        fireTextures.append(SKTexture(imageNamed: "fire2"))
        fireTextures.append(SKTexture(imageNamed: "fire3"))
        fireTextures.append(SKTexture(imageNamed: "fire4"))
        fireTextures.append(SKTexture(imageNamed: "fire5"))
        fireTextures.append(SKTexture(imageNamed: "fire6"))
        fireTextures.append(SKTexture(imageNamed: "fire7"))
        
        // For FireBall animation
        let fireFlyingAnimation = SKAction.animate(with: fireTextures, timePerFrame: 0.2, resize: true, restore: true)
        
        let actionShoot = SKAction.moveBy(x: 500, y: 0, duration: 2)
        
        let actionReturn = SKAction.moveBy(x: -500, y: 0, duration: 0)
        
        let fireShoot = SKAction.group ([actionShoot, fireFlyingAnimation])
        
        let fireShootReturn = SKAction.sequence([fireShoot, actionReturn])
        
        //For the Firering ability
        
        let actionWait = SKAction.wait(forDuration: 10.0)
        
        let actionWaitShort = SKAction.wait(forDuration: 3.0)
        
        let actionMove = SKAction.moveBy(x: 500, y: 0, duration: 0)
        
        let moveWait = SKAction.sequence([actionMove, actionWaitShort, actionReturn, actionWait,])
        
      //ignore repeted key presses.
       guard !event.isARepeat else { return }
        
        
        // obtain the key that's been pressed
    let keyCode: UInt16 = event.keyCode
       print("keyCode = \(keyCode)")
       
        // respond to different keys
        switch keyCode {
        case 125:
            print("Down Arrow Key pressed")
            let moveDown = SKAction.moveBy(x: 0, y: -50, duration: 1)
            player.run(moveDown)
            fire.run(moveDown)
            fireRing.run(moveDown)
        case 124:
             print("Right Arrow Key pressed")
             fireRing.run(moveWait)
        case 123:
             print("left Arrow Key pressed")
        case 126:
             print("up Arrow Key pressed")
              let moveUp = SKAction.moveBy(x: 0, y: 50, duration: 1)
             player.run(moveUp)
             fire.run(moveUp)
            fireRing.run(moveUp)
        case 49:
            fire.run(fireShootReturn)
            
        default:
            break
        }
        
     
        }
        
    }
    

