/*:
 ## Create a Holiday Card!
 
 Now that you've explored a bit, create an animated holiday card!
 
 Here is a 12-second card that Mr. Gordon created.
 
 - Note:
    If the video appears with black bars around it, once the video starts playing, wiggle (change the size) of the Xcode window a little bit to fix the issue.
 
 ![](happy-holidays-720p.mov poster="happy-holidays-poster.png" width="960" height="720")

  - Experiment:
 Aim to include as many SpriteKit concepts as possible that you've learned about when you create your holiday card!
 
 */

// Required frameworks
import PlaygroundSupport    // Allows playground to show live view
import SpriteKit            // Provides 2D graphics classes

// Define the animation size, scene, and scene color
let frame = CGRect(x: 0, y: 0, width: 400, height: 300)
var scene = SKScene(size: frame.size)

// Define, configure, and present the scene
let view = SKView(frame: frame)
view.showsNodeCount = true
view.presentScene(scene)

// Show the view in the live view area
PlaygroundSupport.PlaygroundPage.current.liveView = view

//Making background and giving it no physics body

let background = SKSpriteNode(imageNamed: "BG")
background.position = CGPoint(x: 200, y: 150)

background.physicsBody?.affectedByGravity = false

scene.addChild(background)

// Adding all the tiles I want

//Tile 1
let tile1 = SKSpriteNode(imageNamed: "1")
tile1.position = CGPoint(x:42, y: 30)
tile1.physicsBody = SKPhysicsBody(texture: tile1.texture!,
                                  alphaThreshold: 0.1,
                                 size: tile1.size)
tile1.physicsBody?.affectedByGravity = false
tile1.physicsBody?.mass = 100000
scene.addChild(tile1)

// Tile 2
let tile2 = SKSpriteNode(imageNamed: "2")
tile2.position = CGPoint(x:75, y: 30)
tile2.physicsBody = SKPhysicsBody(texture: tile2.texture!,
                                  alphaThreshold: 0.1,
                                 size: tile2.size)
tile2.physicsBody?.affectedByGravity = false
tile2.physicsBody?.mass = 100000
scene.addChild(tile2)

// Tile 3
let tile3 = SKSpriteNode(imageNamed: "3")
tile3.position = CGPoint(x:103, y: 30)
tile3.physicsBody = SKPhysicsBody(texture: tile3.texture!,
                                  alphaThreshold: 0.1,
                                 size: tile3.size)
tile3.physicsBody?.affectedByGravity = false
tile3.physicsBody?.mass = 100000
scene.addChild(tile3)

//SnowMan
let snowman = SKSpriteNode(imageNamed: "SnowMan_01")
snowman.position = CGPoint(x:70, y: 200)
snowman.physicsBody = SKPhysicsBody(texture: snowman.texture!,
                                  alphaThreshold: 0.1,
                                 size: snowman.size)

scene.addChild(snowman)

/*:
### Useful Resources

#### Sprites

Note that [using copyrighted assets is permissable for personal use in Canada](https://en.wikipedia.org/wiki/Fair_dealing_in_Canadian_copyright_law), but if you wish to publish your work in any fashion – you need to find image assets with [compatible licensing terms](https://search.creativecommons.org).

[Open Game Art](https://opengameart.org) is a good option for graphics assets for your games or animations.
 
For winter themed graphics assets, here are some starting points:
 
* [Winter Platformer](https://opengameart.org/content/winter-platformer-game-tileset) at Open Game Art
* [Winter Tileset](https://opengameart.org/content/winter-tilesets) at Open Game Art
* [Winter Wonderland](https://opengameart.org/content/winter-wonderland-pack) at Open Game Art

#### Decompiling Sprite Sheets

To use arrays of images [like we did on page 8](8%20-%20Animating%20a%20Sprite) you'd get very bored very quickly slicing up a spritesheet manually.

Programs exist that do this automatically for you.

1. Download and [install Adobe Air](https://get.adobe.com/air/).
2. Download and [install Shoebox](http://renderhjs.net/shoebox/).

After those programs are installed, you can [use a sprite sheet like this one](http://spritedatabase.net/files/snes/541/Sprite/MarioLuigi.gif), and [feed it into Shoebox like this](http://renderhjs.net/shoebox/extractSprites.htm) to extract the individual images.
 
 #### Sound Assets
 
 [The Sounds Resource](https://www.sounds-resource.com) has sound effects. Use the search box to find what you need.
  
 [Audacity](https://www.fosshub.com/Audacity.html) is a reasonably capable open source app that is helpful for editing sound file clips, if needed.
 
 #### Some Advice About Art and Music Assets
 
 It's easy to go down a big rabbit hole – that is, spend a lot of time – looking for the "perfect" sound or music asset.
 
 Try to avoid this. I suggest sticking with the links given above, or creating your own art and music assets, if that is an area you are skilled in.
 
 Know that there are many, many free art and music assets out there.
 
 Visual and audio artists do important work and deserve to be compensated fairly for that work – but you should not look to pay for art or music assets to complete a quick assignment for this class.

 It would be a different converstaion – paying a reasonable sum for royalty free music or art assets – if you were looking to complete a larger project – especially if you were aiming to publish your work on the App Store.
 
 [Previous: Freestyle](@previous) | Page 12
 
 */

