import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate
{

  let window = NSWindow()

  func applicationDidFinishLaunching(aNotification: NSNotification)
  {
    window.setContentSize(NSSize(width:600, height:200))
    window.styleMask = NSTitledWindowMask | NSClosableWindowMask |
                       NSMiniaturizableWindowMask |
                       NSResizableWindowMask

    window.opaque = false
    window.center()
    window.title = "Experiment 4"


    let text = NSTextView(frame: NSMakeRect(20, 150, 180, 30))

    text.string = "Some text"
    text.editable = false
    text.backgroundColor = window.backgroundColor
    text.selectable = false
    window.contentView!.addSubview(text)

    let text2 = NSTextView(frame: NSMakeRect(20, 110, 180, 30))
    text2.string = "This is text 2"
    window.contentView!.addSubview(text2)

    window.makeKeyAndOrderFront(window)
    window.level = 1
  }

}

let app = NSApplication.sharedApplication()
let controller = AppDelegate()

app.delegate = controller
app.run()
