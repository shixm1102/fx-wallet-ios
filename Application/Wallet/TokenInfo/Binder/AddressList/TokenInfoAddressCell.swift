import RxSwift
import WKKit
extension TokenInfoAddressListBinder {
    class Cell: FxTableViewCell {
        lazy var view = ItemView(frame: ScreenBounds)
        override func getView() -> UIView { view }
        override func bind(_ viewModel: Any?) {
            guard let vm = viewModel as? CellViewModel else { return }
            let coin = vm.coin
            weak var welf = self
            view.addressLabel.text = vm.address
            vm.remark.asDriver().drive(onNext: { remark in
                welf?.view.remarkLabel.text = remark
                welf?.view.hideRemark(remark.isEmpty)
            }).disposed(by: reuseBag)
            view.balanceLabel.wk.set(amount: vm.balance.value.value, symbol: coin.token, power: coin.decimal, thousandth: coin.decimal, animated: false)
            vm.balance.value.asDriver().drive(onNext: { balance in
                welf?.view.balanceLabel.wk.set(amount: balance, symbol: coin.token, power: coin.decimal, thousandth: coin.decimal)
            }).disposed(by: reuseBag)
        }

        override class func height(model _: Any?) -> CGFloat { 87 }
    }
}
