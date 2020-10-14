
import UIKit
import SnapKit

protocol TypeName: AnyObject {
    static var typeName: String { get }
}

extension TypeName {
    static var typeName: String {
        let type = String(describing: self)
        return type
    }
}

public protocol CellObject {
  var viewIdentifier: String { get }
}

struct DepartureCellModel: CellObject {
  let viewIdentifier: String = DepartureCell.typeName
  let id: String
  private let departureTime: Date
  private let arrivalTime: Date
  let locationName: String?
  private let price: Double
  private let currency: String?

  init(id: String,
       departureTime: Date,
       arrivalTime: Date,
       locationName: String?,
       price: Double,
       currency: String?) {
    self.departureTime = departureTime
    self.arrivalTime = arrivalTime
    self.locationName = locationName
    self.price = price
    self.currency = currency
    self.id = id
  }

  var timing: NSAttributedString {
    return NSAttributedString(string: "Departure: \(departureTime.humanReadableFormat) \nArrival: \(arrivalTime.humanReadableFormat)")
  }

  var priceInfo: String {
    var currencyType = ""
    if let currency = currency {
      currencyType = currency
    }
    return (currencyType.count > 0 ? "\(currencyType) " : "") + String(price)
  }

}

final class DepartureCell: UITableViewCell, TypeName {

  private let timing: UILabel = {
    let label = UILabel(frame: .zero)
    label.textColor = .black
    label.textAlignment = .left
    label.numberOfLines = 0
    return label
  }()

  private let location: UILabel = {
    let label = UILabel(frame: .zero)
    label.textColor = .black
    label.textAlignment = .left
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 12)
    return label
  }()

  private let price: UILabel = {
    let label = UILabel(frame: .zero)
    label.textColor = .black
    label.textAlignment = .right
    return label
  }()



  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  private func setup() {
     setupView()
     setupConstraints()
   }

   private func setupView() {
    contentView.addSubview(timing)
     contentView.addSubview(location)
     contentView.addSubview(price)
   }

   private enum Constants {
    static let titleLabelLeadingOffset = 16
    static let titleLabelTopOffset = 2
    static let subTitleLabelTopOffset = 8
    static let subTitleLabelBottonInset = 8
    static let priceTrailingInset = 8
    static let priceLeadingOffset = 8
   }

   private func setupConstraints() {

    timing.snp.makeConstraints { make in
      make.top.equalTo(contentView.snp.top).offset(Constants.titleLabelTopOffset)
      make.leading.equalTo(contentView.snp.leading).offset(Constants.titleLabelLeadingOffset)
    }

    location.snp.makeConstraints { make in
      make.top.equalTo(timing.snp.bottom).offset(Constants.subTitleLabelTopOffset)
      make.leading.equalTo(timing)
      make.bottom.equalTo(contentView.snp.bottom).inset(Constants.subTitleLabelBottonInset)
    }

    price.snp.makeConstraints { make in
      make.centerY.equalTo(contentView.snp.centerY)
      make.trailing.equalTo(contentView.snp.trailing).inset(Constants.priceTrailingInset)
      make.leading.equalTo(timing.snp.trailing).offset(Constants.priceLeadingOffset)
    }

  }

  func update(with model: DepartureCellModel) {
    timing.attributedText = model.timing
    location.text = model.locationName
    price.text = model.priceInfo

  }
}
