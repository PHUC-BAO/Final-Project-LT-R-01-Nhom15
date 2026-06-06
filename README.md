# 📊 Báo Cáo Đồ Án Môn Học: Lập Trình R Cho Phân Tích
### Nhóm 17 — Môn: Lập trình R cho phân tích

---

## 1. 👥 Thành viên nhóm

| Họ và tên | MSSV |
|-----------|------|
| Trần Phúc Bảo | 24133005 |
| Lê Hồ Quốc Huy | 22133025 |
| Phạm Đức Khoa | 24149170 |
---

## 2. 🎯 Giới thiệu đề tài

> **"Phân tích các yếu tố ảnh hưởng đến thu nhập của Freelancer toàn cầu"**

Trong bài báo cáo này, nhóm 17 lựa chọn tập dữ liệu thực tế từ Kaggle về thu nhập và xu hướng việc làm của Freelancer toàn cầu để thực hiện phân tích toàn diện — từ khám phá dữ liệu, trực quan hóa đến xây dựng mô hình dự đoán bằng ngôn ngữ R.

### Mục tiêu
- Xác định các yếu tố ảnh hưởng lớn nhất đến thu nhập của Freelancer
- So sánh thu nhập theo nền tảng, loại công việc, kinh nghiệm và khu vực khách hàng
- Xây dựng mô hình dự đoán thu nhập dựa trên các đặc trưng của Freelancer

### Câu hỏi nghiên cứu
1. Yếu tố nào ảnh hưởng lớn nhất đến `Earnings_USD`?
2. Nền tảng nào (Upwork, Fiverr, Toptal...) có mức thu nhập trung bình cao nhất?
3. Freelancer kinh nghiệm cao có `Job_Success_Rate` tốt hơn không?
4. `Marketing_Spend` có thực sự đáng đầu tư không?
5. Hợp đồng Fixed Price hay Hourly có lợi hơn?

---

## 3. 📁 Thông tin Dataset

| Thông tin | Chi tiết |
|-----------|---------|
| **Tên file** | `freelancer_earnings_bd.csv` |
| **Nguồn** | [Kaggle — Freelancer Earnings & Job Trends](https://www.kaggle.com/datasets/shohinurpervezshohan/freelancer-earnings-and-job-trends) |
| **Số dòng** | 1.950 |
| **Số cột** | 15 |

### Mô tả các biến chính

| Biến | Kiểu | Mô tả |
|------|------|-------|
| `Freelancer_ID` | int | Mã định danh freelancer |
| `Job_Category` | string | Loại công việc (Web Dev, Data Entry, SEO...) |
| `Platform` | string | Nền tảng làm việc (Fiverr, Upwork, Toptal...) |
| `Experience_Level` | string | Mức kinh nghiệm (Beginner / Intermediate / Expert) |
| `Client_Region` | string | Khu vực khách hàng (USA, Asia, Europe...) |
| `Payment_Method` | string | Phương thức thanh toán |
| `Job_Completed` | int | Số công việc đã hoàn thành |
| `Earnings_USD` | float | **Biến mục tiêu** — Thu nhập (USD) |
| `Hourly_Rate` | float | Mức lương theo giờ (USD) |
| `Job_Success_Rate` | float | Tỷ lệ hoàn thành công việc thành công (%) |
| `Client_Rating` | float | Đánh giá từ khách hàng (1–5) |
| `Job_Duration_Days` | int | Thời gian hoàn thành công việc (ngày) |
| `Project_Type` | string | Loại hợp đồng (Fixed / Hourly) |
| `Rehire_Rate` | float | Tỷ lệ được thuê lại (%) |
| `Marketing_Spend` | int | Chi phí marketing (USD) |

---

## 4. 🗂️ Cấu trúc thư mục

```
Final-Project-LT-R-01-Nhom15/
│
├── data/
│   ├── freelancer_earnings_bd.csv     # Dữ liệu gốc
│   └── freelancer_clean.rds           # Dữ liệu sau khi làm sạch 
│
├── 01_cleaning_eda/
│   ├── 01_cleaning_eda.Rmd
│
├── 02_visualization/
│   ├── 02_visualization.Rmd
│
├── 03_modeling/
│   ├── 03_modeling.Rmd
│
├── main_report/
│   └── final_report.Rmd 
│
└── README.md
```

---

## 5. 🔧 Công nghệ sử dụng

| Công cụ | Mục đích |
|---------|----------|
| **R** | Ngôn ngữ phân tích chính |
| **RMarkdown** | Viết báo cáo kết hợp code và văn bản |
| **tidyverse** | Xử lý và làm sạch dữ liệu |
| **ggplot2** | Trực quan hóa dữ liệu |
| **caret / lm()** | Xây dựng mô hình hồi quy |
| **GitHub** | Quản lý phiên bản và cộng tác nhóm |

---

## 6. 🚀 Hướng dẫn chạy

```r
# 1. Clone repo về máy
git clone https://github.com/PHUC-BAO/Final-Project-LT-R-01-Nhom17.git

# 2. Mở RStudio, cài các package cần thiết
install.packages(c("tidyverse", "ggplot2", "caret", "knitr"))

# 3. Chạy lần lượt theo thứ tự
#    Bước 1: knit 01_cleaning_eda.Rmd  → tạo data_cleaned.csv
#    Bước 2: knit 02_visualization.Rmd
#    Bước 3: knit 03_modeling.Rmd

# 4. Knit báo cáo hoàn chỉnh
rmarkdown::render("main_report/final_report.Rmd")

