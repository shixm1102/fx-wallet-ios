import WKKit
extension CheckBackUpViewController {
    class ItemView: UIView {
        required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
        override init(frame: CGRect) {
            super.init(frame: frame)
            logWhenDeinit()
            configuration()
            layoutUI()
        }
        private func configuration() {
            backgroundColor = .clear
        }
        private func layoutUI() {
        }
    }
}
