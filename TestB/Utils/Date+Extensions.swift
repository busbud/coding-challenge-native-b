
import Foundation

extension Date {
  init?(dateStr: String) {
    guard let date = DateFormatter.YYYYMMdd.date(from: dateStr) else { return nil}
    self = date
  }

  var iso8061: String {
    return DateFormatter.iso8601.string(from: self)
  }

  var humanReadableFormat: String {
    return DateFormatter.humanReadable.string(from: self)
  }

}
