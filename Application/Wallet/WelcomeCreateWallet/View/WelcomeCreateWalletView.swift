import WKKit
typealias WelcomeCreateView = WelcomeCreateWalletViewController.View
extension WelcomeCreateWalletViewController {
    class View: UIView {
        class ItemView: UIView {
            lazy var icon: UIImageView = {
                let v = UIImageView(image: IMG("Wallet.Add_W"))
                return v
            }()

            lazy var titleLabel: UILabel = {
                let v = UILabel()
                v.font = XWallet.Font(ofSize: 18, weight: .bold)
                v.autoFont = true
                v.textColor = .white
                v.backgroundColor = .clear
                return v
            }()

            lazy var subtitleLabel: UILabel = {
                let v = UILabel()
                v.font = XWallet.Font(ofSize: 14)
                v.autoFont = true
                v.textColor = COLOR.itemtitle.withAlphaComponent(0.5)
                v.backgroundColor = .clear
                return v
            }()

            @available(*, unavailable)
            required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
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
                addSubview(icon)
                addSubview(titleLabel)
                addSubview(subtitleLabel)
                icon.snp.makeConstraints { make in
                    make.size.equalTo(CGSize(width: 24, height: 24).auto())
                    make.left.equalTo(self.snp.left).offset(24.auto())
                    make.centerY.equalTo(self.snp.centerY)
                }
                titleLabel.snp.makeConstraints { make in
                    make.left.equalTo(icon.snp.right).offset(16.auto())
                    make.right.equalTo(self.snp.right).offset(-24.auto())
                    make.bottom.equalTo(self.snp.centerY).offset(-2.auto())
                    make.height.equalTo(22.auto())
                }
                subtitleLabel.snp.makeConstraints { make in
                    make.top.equalTo(self.snp.centerY).offset(2.auto())
                    make.left.equalTo(icon.snp.right).offset(16.auto())
                    make.right.equalTo(self.snp.right).offset(-24.auto())
                    make.height.equalTo(17.auto())
                }
            }
        }

        lazy var titleLabel: UILabel = {
            let v = UILabel()
            v.text = TR("Welcome.Title")
            v.font = XWallet.Font(ofSize: 40, weight: .medium)
            v.autoFont = true
            v.textColor = COLOR.title
            v.backgroundColor = .clear
            return v
        }()

        lazy var subtitleLabel: UILabel = {
            let v = UILabel()
            v.font = XWallet.Font(ofSize: 16)
            v.autoFont = true
            v.textColor = COLOR.subtitle
            v.numberOfLines = 0
            v.backgroundColor = .clear
            return v
        }()

        lazy var pannel = UIView().then {
            $0.backgroundColor = COLOR.title
        }

        lazy var createItemView: ItemView = {
            let v = ItemView()
            return v
        }()

        lazy var lineView: UIView = {
            let v = UIView(COLOR.line)
            return v
        }()

        lazy var importItemView: ItemView = {
            let v = ItemView()
            return v
        }()

        lazy var createControl: UIControl = {
            let v = UIControl(frame: .zero)
            return v
        }()

        lazy var importControl: UIControl = {
            let v = UIControl(frame: .zero)
            return v
        }()

        let tipLabel = UILabel().then {
            $0.font = XWallet.Font(ofSize: 10)
            $0.textColor = UIColor.black
            $0.text = ServerENV.current.rawString
        }

        @available(*, unavailable)
        required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
        override init(frame: CGRect) {
            super.init(frame: frame)
            logWhenDeinit()
            configuration()
            layoutUI()
        }

        private func configuration() {
            backgroundColor = .white
            pannel.autoCornerRadius = 36
            createItemView.titleLabel.text = TR("Welcome.Item.CreateTitle")
            createItemView.subtitleLabel.text = TR("Welcome.Item.CreateSubTitle")
            importItemView.titleLabel.text = TR("Welcome.Item.ImportTitle")
            importItemView.subtitleLabel.text = TR("Welcome.Item.ImportSubTitle")
            let subTitle = TR("Welcome.SubTitle")
            subTitle.lineSpacingLabel(subtitleLabel)
            subtitleLabel.autoFont = true
            pannel.wk.addBorderShadow(tag: 101, border: (1, .white))
        }

        private func layoutUI() {
            addSubview(titleLabel)
            addSubview(subtitleLabel)
            addSubview(pannel)
            pannel.addSubview(createItemView)
            pannel.addView(lineView)
            pannel.addSubview(importItemView)
            titleLabel.snp.makeConstraints { make in
                make.top.equalTo(8.auto() + FullNavBarHeight)
                make.left.equalToSuperview().inset(24.auto())
            }
            addSubview(tipLabel)
            tipLabel.isHidden = true
            tipLabel.snp.makeConstraints { make in
                make.bottom.equalTo(titleLabel.snp.bottom)
                make.left.equalTo(titleLabel.snp.right)
            }
            subtitleLabel.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(12.auto())
                make.left.right.equalToSuperview().inset(24.auto())
            }
            pannel.snp.makeConstraints { make in
                make.height.equalTo(177.auto())
                make.left.right.equalTo(self).inset(24.auto())
                make.bottom.equalTo(self.snp.bottom).offset(-38.auto())
            }
            createItemView.snp.makeConstraints { make in
                make.left.right.equalTo(pannel)
                make.height.equalTo(72.auto())
                make.bottom.equalTo(lineView.snp.top)
            }
            lineView.snp.makeConstraints { make in
                make.left.right.equalTo(pannel).inset(24.auto())
                make.centerY.equalToSuperview()
                make.height.equalTo(1)
            }
            importItemView.snp.makeConstraints { make in
                make.left.right.equalTo(pannel)
                make.height.equalTo(72.auto())
                make.top.equalTo(lineView.snp.bottom)
            }
            createItemView.addSubview(createControl)
            importItemView.addSubview(importControl)
            createControl.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            importControl.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }
}
