package com.example.controller.booking;


import com.example.model.booking.TourEmailDto;
import com.example.service.booking.BookingService;
import com.example.service.booking.IBookingService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import javax.mail.*;
import javax.mail.internet.*;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

@WebServlet(name = "MailServlet", value = "/MailServlet")
public class SendEmailServlet extends HttpServlet {
    IBookingService service = new BookingService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Thông tin đăng nhập tài khoản email gửi
        final String username = "nguyenductrung1232@gmail.com";
        final String password = "knbhqeoqqlxcpczc";
        // Cấu hình thông tin SMTP server
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        // Tạo phiên gửi email
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(username, password);
            }
        });
//        int customerId = Integer.parseInt(request.getParameter("customerid"));
        List<TourEmailDto> email = null;
        try {
            email = service.displayEmail(4);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        String htmlContent = "<html lang=\"en\">" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "    <title>Xác nhận đặt tour</title>\n" +
                "    <style>\n" +
                "        body {\n" +
                "            font-family: Arial, sans-serif;\n" +
                "            line-height: 1.6;\n" +
                "        }\n" +
                "\n" +
                "        .container {\n" +
                "            max-width: 600px;\n" +
                "            margin: 0 auto;\n" +
                "            padding: 20px;\n" +
                "            border: 1px solid #ccc;\n" +
                "            border-radius: 15px;\n" +
                "            background-color: #049247;\n" +
                "        }\n" +
                "\n" +
                "        h2 {\n" +
                "            color: #333;\n" +
                "        }\n" +
                "\n" +
                "        table {\n" +
                "            width: 95%;\n" +
                "            margin-top: 20px;\n" +
                "            border-collapse: collapse;\n" +
                "        }\n" +
                "\n" +
                "        th, td {\n" +
                "            border: 1px solid #ccc;\n" +
                "            padding: 10px;\n" +
                "            text-align: left;\n" +
                "        }\n" +
                "\n" +
                "        th {\n" +
                "            background-color: #f2f2f2;\n" +
                "        }\n" +
                "    </style>\n" +
                "</head>\n" +
                "<body>\n" +
                "\n" +
//                "<img style=\"margin-left: 450px\" src=\"../../tai_lieu_anh/Screenshot 2023-08-03 160323.png\" height=\"405\" width=\"630\"/>\n" +
//                "<div class=\"container\">\n" +
                "    <div style=\"background-color: white;margin-top: 0px;border-radius: 15px\">\n";
        for (int i = 0; i < email.size(); i++) {
            htmlContent += "        <h2 style=\"margin-left: 15px;padding-top: 20px\">" + email.get(i).getTourName() + "</h2>\n" +
                    "        <table style=\"margin-left:15px \">\n" +
                    "            <tr>\n" +
                    "                <th>Ngày khởi hành :</th>\n" +
                    "                <td>"+email.get(i).getStartDate() +"</td>\n" +
                    "            </tr>\n" +
                    "            <tr>\n" +
                    "                <th>Ngày kết thúc:</th>\n" +
                    "                <td>"+email.get(i).getEndDate() +"</td>\n" +
                    "            </tr>\n" +
                    "            <tr>\n" +
                    "                <th>Thời gian:</th>\n" +
                    "                <td>"+email.get(i).getTime() +" ngày</td>\n" +
                    "            </tr>\n" +
                    "            <tr>\n" +
                    "                <th>Số lượng:</th>\n" +
                    "                <td>"+email.get(i).getQuantity() +"</td>\n" +
                    "            </tr>\n" +
                    "            <tr>\n" +
                    "                <th>Tên hướng dẫn viên:</th>\n" +
                    "                <td>"+email.get(i).getCustomerName() +"</td>\n" +
                    "            </tr>\n" +
                    "            <tr>\n" +
                    "                <th>Số điện thoại :</th>\n" +
                    "                <td>"+email.get(i).getPhone() +"</td>\n" +
                    "            </tr>\n" +
                    "            <tr>\n" +
                    "                <th>Tổng số tiền đã thanh toán:</th>\n" +
                    "                <td>$"+email.get(i).getPrice() +"</td>\n" +
                    "            </tr>\n" +
                    "        </table>\n";
        }
        htmlContent += "        <p style=\"margin-left: 15px\">\n" +
                "            Cảm ơn bạn đã chọn gói tour của chúng tôi. Chúng tôi rất háo hức chào đón bạn đến chuyến đi đáng nhớ trong\n" +
                "            đời.\n" +
                "            Nếu bạn có bất kỳ câu hỏi hoặc cần hỗ trợ thêm, vui lòng liên hệ với chúng tôi qua địa chỉ\n" +
                "            support@example.com.\n" +
                "        </p>\n" +
                "        <p style=\"margin-left: 15px;padding-bottom: 15px\">\n" +
                "            Trân trọng,<br>\n" +
                "            Công ty Tour của bạn\n" +
                "        </p>\n" +
                "    </div>\n" +
                "</div>\n" +
                "</body>\n" +
                "</html>";

        try {
            // Tạo đối tượng MimeMessage
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("vantanloi7585@gmail.com")); //Email người nhận
            message.setSubject("[Xác Nhận Thành Công] - Email xác nhận - Chi tiết tour");

            // Đặt đoạn mã HTML làm nội dung của email
            message.setContent(htmlContent, "text/html; charset=utf-8");

            // Gửi email
            Transport.send(message);
            response.sendRedirect("/BookingServlet?action=success");
        } catch (MessagingException e) {
            response.getWriter().println("Failed to send email: " + e.getMessage());
        }
    }
}