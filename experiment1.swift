import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

  let window = NSWindow()

  func applicationDidFinishLaunching(aNotification: NSNotification) {
    window.makeKeyAndOrderFront(window)
      window.level = 1
  }

}

let app = NSApplication.sharedApplication()
let controller = AppDelegate()

app.delegate = controller
app.run()
