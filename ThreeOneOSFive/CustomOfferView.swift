import SwiftUI

// Cấu trúc dữ liệu cho Tính năng / Offer
struct CustomFeature: Identifiable {
    let id = UUID()
    let name: String
    let detail: String
    let category: String
    let isVIP: Bool
    let link: String
}

// Giao diện danh sách Aim FF & Offer
struct CustomOfferView: View {
    @State private var featureList: [CustomFeature] = [
        CustomFeature(name: "Tính năng Aim Body", detail: "Tối ưu hóa tâm ngắm vào vùng thân", category: "Free Fire", isVIP: false, link: "https://example.com/aim-body"),
        CustomFeature(name: "Tính năng Aim FF Pro", detail: "Cấu hình kéo tâm và độ nhạy tự động", category: "Free Fire", isVIP: true, link: "https://example.com/aim-ff"),
        CustomFeature(name: "Offer Nhận Code Quà Tặng", detail: "Hoàn thành nhiệm vụ để nhận giftcode", category: "Offer", isVIP: false, link: "https://example.com/offer-1"),
        CustomFeature(name: "Offer Mở Khóa VIP", detail: "Đăng ký thành viên VIP để mở toàn bộ tính năng", category: "Offer", isVIP: true, link: "https://example.com/offer-2")
    ]

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("TÍNH NĂNG FREE FIRE").font(.caption).bold().foregroundColor(.blue)) {
                    ForEach(featureList.filter { $0.category == "Free Fire" }) { item in
                        FeatureRowView(item: item)
                    }
                }
                
                Section(header: Text("DANH SÁCH OFFER DÀNH CHO BẠN").font(.caption).bold().foregroundColor(.green)) {
                    ForEach(featureList.filter { $0.category == "Offer" }) { item in
                        FeatureRowView(item: item)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("3105 Offers & Tools")
        }
    }
}

struct FeatureRowView: View {
    let item: CustomFeature
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(item.name)
                        .font(.headline)
                    if item.isVIP {
                        Text("VIP")
                            .font(.caption2)
                            .bold()
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(4)
                    }
                }
                Text(item.detail)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {
                if let url = URL(string: item.link) {
                    UIApplication.shared.open(url)
                }
            }) {
                Text("Mở ngay")
                    .font(.footnote)
                    .bold()
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding(.vertical, 4)
    }
}