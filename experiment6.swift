import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate
{

  let window = NSWindow()

  func applicationDidFinishLaunching(aNotification: NSNotification)
  {
    window.setContentSize(NSSize(width:600, height:300))
    window.styleMask = NSTitledWindowMask | NSClosableWindowMask |
                       NSMiniaturizableWindowMask |
                       NSResizableWindowMask

    window.opaque = false
    window.center()
    window.title = "Le Doge App"

    let path = "./doge.jpg"
    let img = NSImage(contentsOfFile: path)!
    let imgView = NSImageView(frame: NSMakeRect(60, 30, 480, 240))
    imgView.image = img
    window.contentView!.addSubview(imgView)

    window.makeKeyAndOrderFront(window)
    window.level = 1
  }

}

let app = NSApplication.sharedApplication()
let controller = AppDelegate()

app.delegate = controller
app.run()
