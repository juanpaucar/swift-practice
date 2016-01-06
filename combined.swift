import Cocoa

class MyButton: NSButton {
  var onclick: () -> Bool = {() -> Bool in true}

  func myclick(sender: AnyObject) {
    self.onclick()
  }
}

func make_button(window: NSWindow,
                 _ size:(x:Int, y:Int, width:Int, ht:Int),
                 _ title:String
) -> MyButton {
  let button = MyButton()
  button.frame = NSMakeRect(CGFloat(size.x), CGFloat(size.y),
                            CGFloat(size.width), CGFloat(size.ht))

  button.title = title
  button.bezelStyle = .ThickSquareBezelStyle
  button.target = button
  button.action = "myclick:"
  window.contentView!.addSubview(button)
  return button
}

func make_entry(window:NSWindow,
                _ size:(x:Int, y:Int, width:Int, ht:Int),
                _ str: String
  ) -> NSTextView {
    let text = NSTextView(frame: NSMakeRect(10, 140, 40, 20))
    text.frame = NSMakeRect(CGFloat(size.x), CGFloat(size.y),
                            CGFloat(size.width), CGFloat(size.ht))

    text.string = str
    text.editable = true
    text.selectable = true
    window.contentView!.addSubview(text)
    return text
}

func make_text(window:NSWindow,
               _ size:(x:Int, y:Int, width:Int, ht:Int),
               _ str: String
  ) -> NSTextView {
    let text = NSTextView(frame: NSMakeRect(10, 140, 40, 20))
    text.frame = NSMakeRect(CGFloat(size.x), CGFloat(size.y),
                            CGFloat(size.width), CGFloat(size.ht))

    text.string = str
    text.editable = false
    text.backgroundColor = window.backgroundColor
    text.selectable = false
    window.contentView!.addSubview(text)
    return text
}

func set_window_args(window:NSWindow, _ w:Int, _ h:Int, _ title:String) ->
  Void {
    window.setContentSize(NSSize(width:w, height:h))
    window.styleMask = NSTitledWindowMask | NSClosableWindowMask |
                       NSMiniaturizableWindowMask |
                       NSResizableWindowMask

    window.opaque = false
    window.center()
    window.title = title
}

class AppDelegate: NSObject, NSApplicationDelegate
{
  let window = NSWindow()

  func applicationDidFinishLaunching(aNotification: NSNotification)
  {
    set_window_args(window, 400, 200, "My title")
    let entry1 = make_entry(window, (200, 80, 180, 30), "1")
    let text1  = make_text(window, (20, 80, 180, 30), "Hello form me")
    let text2  = make_text(window, (20, 120, 180, 30), "Another field")
    let button1 = make_button(window, (120, 40, 80, 30), "Click")

    let f1 = {() -> Bool in
        text1.string = "Callback worked"
        print(entry1.textStorage!.string)
        text2.string = entry1.textStorage!.string
        return true}

    button1.onclick = f1

    window.makeKeyAndOrderFront(window)
    window.level = 1
  }
}

let app = NSApplication.sharedApplication()
app.setActivationPolicy(.Regular)

let controller = AppDelegate()

app.delegate = controller
app.run()
