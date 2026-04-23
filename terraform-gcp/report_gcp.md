# Báo cáo kết quả Benchmark trên Google Cloud Platform

## 1. Cấu hình hạ tầng (Infrastructure)
*   **Machine Type:** n2-standard-8 (8 vCPUs, 32 GB Memory).
*   **Hệ điều hành:** Debian 11.
*   **Phần cứng:** CPU Only (Không sử dụng GPU do giới hạn Free Tier).
*   **Mô hình sử dụng:** LightGBM (Fraud Detection).

## 2. Kết quả Benchmark
Dựa trên tệp `benchmark_result.json`:

*   **Thời gian huấn luyện (Training time):** ~0.885 giây.
*   **Độ chính xác (AUC-ROC):** 0.9384.
*   **Tốc độ dự báo (Inference speed):** 
    *   **Batch Inference:** 3.4 ms (cho 56,962 bản ghi).
    *   **Single row latency (P50):** 0.317 ms.
    *   **Single row latency (P99):** 0.429 ms.

## 3. Đánh giá và Kết luận
Hệ thống được triển khai trên môi trường GCP Private Subnet, truy cập thông qua IAP (Identity-Aware Proxy) và Load Balancer. Mặc dù không sử dụng GPU, thuật toán LightGBM vẫn đạt được hiệu năng cực kỳ ấn tượng trên CPU `n2-standard-8`:
*   Thời gian huấn luyện chưa tới 1 giây cho hơn 200,000 dòng dữ liệu.
*   Độ chính xác AUC-ROC đạt mức cao (> 0.93).
*   Độ trễ dự báo cực thấp, đáp ứng tốt cho các ứng dụng realtime.

Việc chuyển đổi từ GPU sang CPU giúp tối ưu hóa chi phí trong giai đoạn thử nghiệm (Free Tier) mà vẫn đảm bảo được các yêu cầu về mặt kỹ thuật cho bài toán Fraud Detection.
