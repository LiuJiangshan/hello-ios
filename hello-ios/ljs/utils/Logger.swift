class Logger {

    var debug = true

    var tag = ""

    init(_ tag: String) {
        self.tag = tag
    }

    init(_ tag: String, _ debug: Bool) {
        self.tag = tag
        self.debug = debug
    }

    func d(_ msg: Any) {
        if debug {
            print("\(tag):\(msg)")
        }
    }
}
