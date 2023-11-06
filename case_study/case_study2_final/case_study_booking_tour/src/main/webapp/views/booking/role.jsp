<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker@3.0.5/daterangepicker.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<%--<div>--%>
<%--    <label for="monthSelect">Tháng:</label>--%>
<%--    <select id="monthSelect"></select>--%>

<%--    <label for="yearSelect">Năm:</label>--%>
<%--    <select id="yearSelect"></select>--%>
<%--    <button onclick="layDuLieuDoanhThu()">Xem</button>--%>

<%--</div>--%>
<%--<div style="width: 1000px;">--%>
<%--    <canvas id="revenueChart" width="1000" height="300"></canvas>--%>
<%--</div>--%>
<div class="container mt-5">
    <div class="form-row">
        <div style="display: inline-block;width: 40%">
            <label for="dateRangePicker">Chọn khoảng thời gian:</label>
            <input type="text" class="form-control" id="dateRangePicker">
        </div>
        <div style="display: inline-block">
            <button class="btn btn-primary" onclick="luuDuLieu()">Xem</button>
        </div>
    </div>
</div>

<table class="table table-hover" style="width: 80%;margin-left: 10%;margin-right: 10%">
    <tr>
        <th>ID</th>
        <th>Tên Tour</th>
        <th>Ngày Booking</th>
        <th> Ngày Khởi Hành Tour</th>
        <th> Ngày Kết Thúc Tour</th>
        <th> Tổng Cộng</th>
        <th>Hướng Dẫn Viên</th>
    </tr>
    <c:forEach var="role" items="${tours}">
        <tr>
            <th>${role.bookingId}</th>
            <td>${role.tourName}</td>
            <td>${role.bookingDate}</td>
            <td>${role.startDate}</td>
            <td>${role.endDate}</td>
            <td>đ${role.price}</td>
            <td>${role.employeeName}</td>
        </tr>
    </c:forEach>
</table>
<%--<script>--%>
<%--    // Lấy năm hiện tại--%>
<%--    const currentYear = new Date().getFullYear();--%>

<%--    // Lấy thẻ select trong HTML--%>
<%--    const monthSelect = document.getElementById("monthSelect");--%>
<%--    const yearSelect = document.getElementById("yearSelect");--%>

<%--    // Hàm tạo danh sách các tháng từ 1 đến 12--%>
<%--    function createMonthOptions() {--%>
<%--        for (let month = 1; month <= 12; month++) {--%>
<%--            const option = document.createElement("option");--%>
<%--            option.text = month.toString().padStart(2, "0");--%>
<%--            option.value = month.toString().padStart(2, "0");--%>
<%--            monthSelect.add(option);--%>
<%--        }--%>
<%--    }--%>

<%--    // Hàm tạo danh sách các năm từ 0000 đến năm hiện tại--%>
<%--    for (let year = currentYear; year >= 0; year--) {--%>
<%--        const option = document.createElement("option");--%>
<%--        option.text = year === 0 ? "0000" : year.toString().padStart(4, "0");--%>
<%--        option.value = year === 0 ? "0000" : year.toString().padStart(4, "0");--%>
<%--        yearSelect.add(option);--%>
<%--    }--%>

<%--    // Gọi các hàm tạo danh sách--%>
<%--    createMonthOptions();--%>
<%--    createYearOptions();--%>
<%--</script>--%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/daterangepicker@3.0.5/daterangepicker.min.js"></script>
<%--<script>--%>


<%--    // Hàm để lấy dữ liệu doanh thu từ cơ sở dữ liệu--%>
<%--    async function layDuLieuDoanhThu() {--%>
<%--        const selectedMonth = document.getElementById('monthSelect').value;--%>
<%--        const yearSelect = document.getElementById('yearSelect').value;--%>
<%--        const response = await fetch(`/getRoleServlet?action=chart&month=${selectedMonth}&year=${yearSelect}`);--%>
<%--        const data = await response.json();--%>
<%--        return data;--%>
<%--    }--%>

<%--    // Hàm để cập nhật biểu đồ với dữ liệu doanh thu lấy từ cơ sở dữ liệu--%>
<%--    async function capNhatBieuDo() {--%>
<%--        const duLieuDoanhThu = await layDuLieuDoanhThu();--%>

<%--        // Tùy chọn cấu hình cho biểu đồ--%>
<%--        const tuyChonBieuDo = {--%>
<%--            responsive: true, // Cho phép thay đổi kích thước biểu đồ khi cửa sổ trình duyệt thay đổi--%>
<%--            scales: {--%>
<%--                y: {--%>
<%--                    beginAtZero: true // Bắt đầu hiển thị trục y từ giá trị 0--%>
<%--                }--%>
<%--            }--%>
<%--        };--%>

<%--        // Tạo biểu đồ--%>
<%--        const ctx = document.getElementById('revenueChart').getContext('2d');--%>
<%--        const bieuDoDoanhThu = new Chart(ctx, {--%>
<%--            type: 'line', // Loại biểu đồ đường--%>
<%--            data: {--%>
<%--                labels: duLieuDoanhThu.map(item => item.booking_date), // Tên các ngày trong tháng--%>
<%--                datasets: [--%>
<%--                    {--%>
<%--                        label: 'Doanh thu',--%>
<%--                        data: duLieuDoanhThu.map(item => item.daily_revenue),--%>
<%--                        borderColor: 'rgba(255, 99, 132, 1)',--%>
<%--                        backgroundColor: 'rgba(255, 99, 132, 0.2)',--%>
<%--                        borderWidth: 2--%>
<%--                    }--%>
<%--                ]--%>
<%--            },--%>
<%--            options: tuyChonBieuDo // Tùy chọn cấu hình--%>
<%--        });--%>
<%--    }--%>

<%--    // Gọi hàm để cập nhật biểu đồ--%>
<%--    capNhatBieuDo();--%>
<%--</script>--%>
<script>
    let startDate;
    let endDate;

    $(document).ready(function () {
        $('#dateRangePicker').daterangepicker({
            startDate: moment().startOf('day'),
            endDate: moment().endOf('day'),
            locale: {
                format: 'DD/MM/YYYY',
                separator: ' - ',
                applyLabel: 'Chọn',
                cancelLabel: 'Hủy',
                customRangeLabel: 'Tùy chỉnh',
                daysOfWeek: ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'],
                monthNames: [
                    'Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6',
                    'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'
                ],
                firstDay: 1
            }
        });
        $('#dateRangePicker').on('apply.daterangepicker', function (ev, picker) {
            startDate = picker.startDate;
            endDate = picker.endDate;
        });
        $('#sendButton').on('click', function () {
            luuDuLieu();
        });
    });

    function luuDuLieu() {
        if (startDate && endDate) {
            const startFormatted = startDate.format('YYYY-MM-DD');
            const endFormatted = endDate.format('YYYY-MM-DD');
            console.log('Ngày bắt đầu:', startFormatted);
            console.log('Ngày kết thúc:', endFormatted);
            window.location.href = '/RoleServlet?action=failure&startDate=' + startFormatted + '&endDate=' + endFormatted;
        } else {
            console.log('Vui lòng chọn khoảng thời gian trước khi lưu.');
        }
    }
</script>
</body>
</html>
