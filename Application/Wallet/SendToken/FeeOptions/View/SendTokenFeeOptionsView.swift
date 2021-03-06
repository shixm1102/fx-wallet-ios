import WKKit
extension SendTokenFeeOptionsViewController {
    class View: BaseView { lazy var legalAmountLabel = UILabel(font: XWallet.Font(ofSize: 24, weight: .bold))
        lazy var amountLabel = UILabel(font: XWallet.Font(ofSize: 14), textColor: UIColor.white.withAlphaComponent(0.5))
        var amountHeight: CGFloat { (70 + 24).auto() }
        override func layoutUI() {
            super.layoutUI()
            contentView.addSubviews([amountLabel, legalAmountLabel])
            legalAmountLabel.snp.makeConstraints { make in
                make.top.equalTo(navBar.snp.bottom).offset(8.auto())
                make.left.right.equalToSuperview().inset(24.auto())
                make.height.equalTo(30.auto())
            }
            amountLabel.snp.makeConstraints { make in
                make.top.equalTo(legalAmountLabel.snp.bottom).offset(8.auto())
                make.left.right.equalToSuperview().inset(24.auto())
            }
            listView.snp.remakeConstraints { make in
                make.top.equalTo(navBarHeight + amountHeight)
                make.bottom.left.right.equalToSuperview()
            }
        }
    }
}

extension SendTokenFeeOptionsViewController {
    class ContentCell: FxTableViewCell {
        lazy var tapButton = UIButton(.clear)
        private lazy var slowLabel = UILabel(text: TR("SendToken.Fee.Slow"), font: XWallet.Font(ofSize: 14), textColor: HDA(0xECB592))
        lazy var slowTimeLabel = UILabel(font: XWallet.Font(ofSize: 12), textColor: HDA(0xECB592))
        lazy var slowGPLabel = UILabel(font: XWallet.Font(ofSize: 14))
        private lazy var slowGPSymbolLabel = UILabel(text: "GWEI", font: XWallet.Font(ofSize: 12), textColor: UIColor.white.withAlphaComponent(0.5))
        private lazy var normalLabel = UILabel(text: TR("SendToken.Fee.Normal"), font: XWallet.Font(ofSize: 14), textColor: HDA(0xC8D2B3))
        lazy var normalTimeLabel = UILabel(font: XWallet.Font(ofSize: 12), textColor: HDA(0xC8D2B3))
        lazy var normalGPLabel = UILabel(font: XWallet.Font(ofSize: 14))
        private lazy var normalGPSymbolLabel = UILabel(text: "GWEI", font: XWallet.Font(ofSize: 12), textColor: UIColor.white.withAlphaComponent(0.5))
        private lazy var fastLabel = UILabel(text: TR("SendToken.Fee.Fast"), font: XWallet.Font(ofSize: 14), textColor: HDA(0xA6F0D4))
        lazy var fastTimeLabel = UILabel(font: XWallet.Font(ofSize: 12), textColor: HDA(0xA6F0D4))
        lazy var fastGPLabel = UILabel(font: XWallet.Font(ofSize: 14))
        private lazy var fastGPSymbolLabel = UILabel(text: "GWEI", font: XWallet.Font(ofSize: 12), textColor: UIColor.white.withAlphaComponent(0.5))
        private lazy var gasPriceTitleLabel = UILabel(text: "Gas Price", font: XWallet.Font(ofSize: 14), textColor: UIColor.white.withAlphaComponent(0.5))
        lazy var gasPriceSymbolLabel = UILabel(text: "GWEI", font: XWallet.Font(ofSize: 16))
        var gasPriceInputTF: UITextField { gasPriceInputView.interactor }
        lazy var gasPriceInputView: FxRoundTextField = {
            let v = FxRoundTextField.standard
            v.backgroundColor = HDA(0x1B1D41)
            v.interactor.font = XWallet.Font(ofSize: 16)
            v.interactor.rightViewMode = .always
            v.interactor.keyboardType = .decimalPad
            v.editBorderColors = (HDA(0x0552DC), .clear)
            v.editBackgroundColors = (.clear, HDA(0x1B1D41))
            return v
        }()

        lazy var gasLimitNoticeLabel = UILabel(text: TR("SendToken.Fee.MinimalGasLimit$", "21000"), font: XWallet.Font(ofSize: 14), textColor: HDA(0xFA6237))
        private lazy var gasLimitTitleLabel = UILabel(text: "Gas Limit", font: XWallet.Font(ofSize: 14), textColor: UIColor.white.withAlphaComponent(0.5))
        var gasLimitInputTF: UITextField { gasLimitInputView.interactor }
        lazy var gasLimitInputView: FxRoundTextField = {
            let v = FxRoundTextField.standard
            v.backgroundColor = HDA(0x1B1D41)
            v.interactor.font = XWallet.Font(ofSize: 16)
            v.interactor.keyboardType = .decimalPad
            v.editBorderColors = (HDA(0x0552DC), .clear)
            v.editBackgroundColors = (.clear, HDA(0x1B1D41))
            return v
        }()

        override class func height(model _: Any?) -> CGFloat { 320.auto() }
        override func layoutUI() {
            gasLimitNoticeLabel.isHidden = true
            contentView.addSubviews([tapButton])
            contentView.addSubviews([slowLabel, slowGPLabel, slowTimeLabel, slowGPSymbolLabel])
            contentView.addSubviews([normalLabel, normalGPLabel, normalTimeLabel, normalGPSymbolLabel])
            contentView.addSubviews([fastLabel, fastGPLabel, fastTimeLabel, fastGPSymbolLabel])
            contentView.addSubviews([gasPriceTitleLabel, gasPriceInputView, gasLimitTitleLabel, gasLimitNoticeLabel, gasLimitInputView])
            addLines()
            tapButton.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            slowLabel.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.left.equalTo(24.auto())
                make.height.equalTo(18.auto())
            }
            slowTimeLabel.snp.makeConstraints { make in
                make.top.equalTo(slowLabel.snp.bottom)
                make.left.equalTo(slowLabel)
                make.height.equalTo(18.auto())
            }
            slowGPLabel.snp.makeConstraints { make in
                make.top.equalTo(slowTimeLabel.snp.bottom).offset(45.auto())
                make.left.equalTo(28.auto())
                make.height.equalTo(18.auto())
            }
            slowGPSymbolLabel.snp.makeConstraints { make in
                make.top.equalTo(slowGPLabel.snp.bottom)
                make.left.equalTo(slowGPLabel)
                make.height.equalTo(15.auto())
            }
            normalLabel.snp.makeConstraints { make in
                make.top.equalTo(slowLabel)
                make.centerX.equalToSuperview()
                make.height.equalTo(18.auto())
            }
            normalTimeLabel.snp.makeConstraints { make in
                make.top.equalTo(normalLabel.snp.bottom)
                make.centerX.equalToSuperview()
                make.height.equalTo(18.auto())
            }
            normalGPLabel.snp.makeConstraints { make in
                make.top.equalTo(normalTimeLabel.snp.bottom).offset(45.auto())
                make.centerX.equalToSuperview()
                make.height.equalTo(18.auto())
            }
            normalGPSymbolLabel.snp.makeConstraints { make in
                make.top.equalTo(normalGPLabel.snp.bottom)
                make.centerX.equalToSuperview()
                make.height.equalTo(15.auto())
            }
            fastLabel.snp.makeConstraints { make in
                make.top.equalTo(slowLabel)
                make.right.equalTo(-24.auto())
                make.height.equalTo(18.auto())
            }
            fastTimeLabel.snp.makeConstraints { make in
                make.top.equalTo(fastLabel.snp.bottom)
                make.right.equalTo(fastLabel)
                make.height.equalTo(18.auto())
            }
            fastGPLabel.snp.makeConstraints { make in
                make.top.equalTo(fastTimeLabel.snp.bottom).offset(45.auto())
                make.right.equalTo(-28.auto())
                make.height.equalTo(18.auto())
            }
            fastGPSymbolLabel.snp.makeConstraints { make in
                make.top.equalTo(fastGPLabel.snp.bottom)
                make.right.equalTo(fastGPLabel)
                make.height.equalTo(15.auto())
            }
            gasPriceTitleLabel.snp.makeConstraints { make in
                make.top.equalTo(fastGPSymbolLabel.snp.bottom).offset(24.auto())
                make.left.equalTo(24.auto())
                make.height.equalTo(18.auto())
            }
            gasPriceSymbolLabel.wk.adjust()
            gasPriceInputView.interactor.rightView = gasPriceSymbolLabel
            gasPriceInputView.snp.makeConstraints { make in
                make.top.equalTo(gasPriceTitleLabel.snp.bottom).offset(8.auto())
                make.left.right.equalToSuperview().inset(24.auto())
                make.height.equalTo(50.auto())
            }
            gasLimitTitleLabel.snp.makeConstraints { make in
                make.top.equalTo(gasPriceInputView.snp.bottom).offset(16.auto())
                make.left.equalTo(24.auto())
                make.height.equalTo(18.auto())
            }
            gasLimitInputView.snp.makeConstraints { make in
                make.top.equalTo(gasLimitTitleLabel.snp.bottom).offset(8.auto())
                make.left.right.equalToSuperview().inset(24.auto())
                make.height.equalTo(50.auto())
            }
            gasLimitNoticeLabel.snp.makeConstraints { make in
                make.top.equalTo(gasLimitInputView.snp.bottom).offset(2)
                make.left.equalTo(gasLimitInputView)
            }
        }

        private func addLines() {
            let width = ScreenWidth - 24.auto() * 4
            let gradientLine = CAGradientLayer()
            gradientLine.frame = CGRect(x: 0, y: 0, width: ScreenWidth - 24.auto() * 4, height: 6)
            gradientLine.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLine.endPoint = CGPoint(x: 1, y: 0.5)
            gradientLine.colors = [HDA(0xECB592).cgColor, HDA(0xC8D2B3).cgColor, HDA(0xA6F0D4).cgColor]
            gradientLine.cornerRadius = 3
            gradientLine.masksToBounds = true
            gradientLine.frame = CGRect(x: 24.auto(), y: (42 + 8).auto(), width: width, height: 6)
            contentView.layer.addSublayer(gradientLine)
            let path = UIBezierPath()
            var x = 0.0
            let y = 6.0
            let lines = 29
            let interval = Double(width / lines.f)
            let lineWidth: CGFloat = 0.5
            let lineHeight: Double = 3
            let triangles = [1: HDA(0xECB592), lines / 2 + 1: HDA(0xC8D2B3), lines: HDA(0xA6F0D4)]
            for index in 0 ... (lines + 1) {
                if triangles[index] == nil {
                    path.move(to: CGPoint(x: x, y: y))
                    path.addLine(to: CGPoint(x: x, y: lineHeight))
                } else {
                    let p = UIBezierPath()
                    let h = lineHeight * 2
                    p.move(to: CGPoint(x: 0, y: h))
                    p.addLine(to: CGPoint(x: h, y: h))
                    p.addLine(to: CGPoint(x: h * 0.5, y: 0))
                    p.close()
                    let triangle = CAShapeLayer()
                    triangle.path = p.cgPath
                    triangle.fillColor = triangles[index]!.cgColor
                    triangle.frame = CGRect(x: 24.auto() + x - h * 0.5, y: Double(gradientLine.frame.maxY) + 13.auto(), width: h, height: h)
                    contentView.layer.addSublayer(triangle)
                }
                x += (interval - Double(lineWidth * 0.5))
            }
            let scaleLine = CAShapeLayer()
            scaleLine.path = path.cgPath
            scaleLine.lineWidth = lineWidth
            scaleLine.strokeColor = UIColor.white.cgColor
            scaleLine.frame = CGRect(x: 24.auto(), y: gradientLine.frame.maxY + 13.auto(), width: width, height: 6)
            contentView.layer.addSublayer(scaleLine)
        }
    }
}
