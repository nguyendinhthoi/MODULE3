package com.example.repository.booking;

import com.example.model.booking.BookingDto;
import com.example.model.booking.FromDto;
import com.example.model.booking.RoleDto;
import com.example.model.booking.TourEmailDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

public class BookingRepository implements IBookingRepository {

    public static final String DISPLAY = "call list_booking(?);";
    public static final String DISPLAYROLE = "select * from view_booking_status";
    public static final String DISPLAYROLESUCCESS = "select * from view_booking_info_success";
    public static final String DISPLAYFAILURE = "call get_bookings(?,?)";
    public static final String ADDQUANTITY = "UPDATE bookings SET quantity = quantity + 1 WHERE tour_id = ? AND customer_id =? AND status = 0;";
    public static final String DELETEQUANTITY = "UPDATE bookings SET quantity = quantity - 1 WHERE tour_id = ? AND customer_id =? AND status = 0;";
    public static final String DELETEQUANTITYCART = "call GetPendingBookings(?,?);";
    public static final String DISPLAYQUANTITY = "select * from bookings WHERE tour_id = ? AND customer_id = ? AND status = 0; ";
    public static final String INSERTQUANTITY = "INSERT INTO bookings (booking_date, quantity, price, is_delete, customer_id, tour_id, status) SELECT CURDATE(), 1, tours.tour_price, 0, ?, ?, 0 FROM tours WHERE tours.tour_id = ? ";
    public static final String DISPLAYEMAIL = "SELECT t.tour_name, t.start_date, t.end_date, DATEDIFF(t.end_date, t.start_date) AS date_range, b.quantity, e.employee_name, e.employee_phone, b.price * b.quantity AS total_amount, c.customer_email FROM tours t JOIN bookings b ON t.tour_id = b.tour_id JOIN employees e ON t.employee_id = e.employee_id JOIN customers c ON b.customer_id = c.customer_id WHERE b.quantity > 0 AND b.status = 0 AND b.customer_id = ? AND DATE(b.booking_date) = CURDATE() GROUP BY t.tour_id, t.tour_name, t.start_date, t.end_date, e.employee_name, e.employee_phone, b.price, b.quantity, c.customer_email;\n";
    public static final String SUCCESS = "UPDATE bookings SET status = 1 , booking_date = CURDATE()  WHERE  customer_id = ?  AND quantity > 0;";
    private static final String QUANTITYLIST = " DELETE bookings FROM bookings JOIN tours ON bookings.tour_id = tours.tour_id WHERE bookings.status = 0 AND bookings.customer_id = ? ;";
    private static final String CHECKQUANTITY = "SELECT t.tour_id, t.tour_name, t.tour_available_seats, SUM(b.quantity) AS total_booked_quantity FROM tours t JOIN bookings b ON t.tour_id = b.tour_id WHERE b.tour_id = ? AND b.customer_id = ? AND b.status = 1 GROUP BY t.tour_id HAVING t.tour_available_seats - SUM(b.quantity) >= ?;";
    private static final String DISPLAYFROM = "SELECT t.tour_name, t.start_date, t.end_date, b.quantity, b.price, b.quantity * b.price AS total_price, t.image FROM tours AS t INNER JOIN bookings AS b ON t.tour_id = b.tour_id WHERE b.status = 0 AND b.customer_id = ? AND b.quantity > 0;\n";

    @Override
    public FromDto displayFrom(int customerId) throws SQLException {
        Connection connection = null;
        FromDto FromDto = new FromDto();
        try {
            connection = BaseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DISPLAYFROM);
            preparedStatement.setInt(1, customerId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String tourName = resultSet.getString("tour_name");
                String startDate = resultSet.getString("start_date");
                String endDate = resultSet.getString("end_date");
                int quantity = resultSet.getInt("quantity");
                double price = resultSet.getDouble("price");
                DecimalFormat decimalFormatPrice = new DecimalFormat("#,##0");
                String formattedNumberPrice = decimalFormatPrice.format(price);
                double tourSumPrice = resultSet.getDouble("total_price");
                DecimalFormat decimalFormat = new DecimalFormat("#,##0");
                String formattedNumber = decimalFormat.format(tourSumPrice);
                String img = resultSet.getString("image");
                String[] image = img.split(",");
                FromDto.setTourName(tourName);
                FromDto.setStartDate(startDate);
                FromDto.setEndDate(endDate);
                FromDto.setQuantity(quantity);
                FromDto.setPrice(formattedNumberPrice);
                FromDto.setSumPrice(formattedNumber);
                FromDto.setImg(image);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return FromDto;
    }

    @Override
    public List<BookingDto> display(int id) throws SQLException {
        Connection connection = BaseRepository.getConnection();
        ArrayList<BookingDto> arraylist = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareStatement(DISPLAY);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int customerId = resultSet.getInt("customer_id");
            String tourName = resultSet.getString("tour_name");
            double tourPrice = resultSet.getDouble("tour_price");
            int quantity = resultSet.getInt("quantity");
            double tourSumPrice = resultSet.getDouble("total_price");
            int status = resultSet.getInt("status");
            int tourId = resultSet.getInt("tour_id");
            String img = resultSet.getString("image");
            String[] image = img.split(",");
            arraylist.add(new BookingDto(customerId, tourName, tourPrice, quantity, tourSumPrice, status, tourId, image));
        }
        return arraylist;

    }

    @Override
    public int checkQuantity(int id, int customerId, int quantity) throws SQLException {
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(CHECKQUANTITY);
        preparedStatement.setInt(1, id);
        preparedStatement.setInt(2, customerId);
        preparedStatement.setInt(3, quantity);
        ResultSet resultSet = preparedStatement.executeQuery();
        int resultValue = 0;
        if (!resultSet.next()) {
            resultValue = 1;
        }
        resultSet.close();
        preparedStatement.close();
        connection.close();
        return resultValue;
    }


    @Override
    public void addQuantity(int id, int idCustomer) throws SQLException {
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(DISPLAYQUANTITY);
        preparedStatement.setInt(1, id);
        preparedStatement.setInt(2, idCustomer);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (!resultSet.next()) {
            Connection connection2 = BaseRepository.getConnection();
            PreparedStatement preparedStatement2 = connection2.prepareStatement(INSERTQUANTITY);
            preparedStatement2.setInt(1, idCustomer);
            preparedStatement2.setInt(2, id);
            preparedStatement2.setInt(3, id);
            preparedStatement2.executeUpdate();
            preparedStatement2.close();
            connection2.close();
        } else {
            resultSet.close();
            Connection connection1 = BaseRepository.getConnection();
            PreparedStatement preparedStatement1 = connection1.prepareStatement(ADDQUANTITY);
            preparedStatement1.setInt(1, id);
            preparedStatement1.setInt(2, idCustomer);
            preparedStatement1.executeUpdate();
            preparedStatement1.close();
            connection1.close();
        }

        preparedStatement.close();
        connection.close();
    }

    @Override
    public void deleteQuantity(int id, int idCustomer) throws SQLException {
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(DELETEQUANTITY);
        preparedStatement.setInt(1, id);
        preparedStatement.setInt(2, idCustomer);
        preparedStatement.executeUpdate();
    }

    @Override
    public void deleteQuantityCart(int id, int idCustomer) throws SQLException {
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(DELETEQUANTITYCART);
        preparedStatement.setInt(1, id);
        preparedStatement.setInt(2, idCustomer);
        preparedStatement.executeUpdate();
    }

    @Override
    public void success(int customerId) throws SQLException {
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SUCCESS);
        preparedStatement.setInt(1, customerId);
        preparedStatement.executeUpdate();
    }

    @Override
    public List<RoleDto> displayRole() throws SQLException {
        Connection connection = BaseRepository.getConnection();
        ArrayList<RoleDto> arraylist = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareStatement(DISPLAYROLE);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int bookingId = resultSet.getInt("booking_id");
            String tourName = resultSet.getString("tour_name");
            String bookingDate = resultSet.getString("booking_date");
            String startDate = resultSet.getString("start_date");
            String endDate = resultSet.getString("end_date");
            double tourSumPrice = resultSet.getDouble("total_price");
            DecimalFormat decimalFormat = new DecimalFormat("#,##0");
            String formattedNumber = decimalFormat.format(tourSumPrice);
            String customerName = resultSet.getString("customer_name");
            arraylist.add(new RoleDto(bookingId, tourName, bookingDate, startDate, endDate, formattedNumber, customerName));
        }
        return arraylist;
    }

    @Override
    public List<RoleDto> displaySuccess() throws SQLException {
        Connection connection = BaseRepository.getConnection();
        ArrayList<RoleDto> arraylist = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareStatement(DISPLAYROLESUCCESS);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int bookingId = resultSet.getInt("booking_id");
            String tourName = resultSet.getString("tour_name");
            String bookingDate = resultSet.getString("booking_date");
            String startDate = resultSet.getString("start_date");
            String endDate = resultSet.getString("end_date");
            double tourSumPrice = resultSet.getDouble("total_price");
            DecimalFormat decimalFormat = new DecimalFormat("#,##0");
            String formattedNumber = decimalFormat.format(tourSumPrice);
            String customerName = resultSet.getString("customer_name");
            arraylist.add(new RoleDto(bookingId, tourName, bookingDate, startDate, endDate, formattedNumber, customerName));
        }
        return arraylist;
    }

    @Override
    public List<RoleDto> displayFailure(String startDate, String endDate) throws SQLException {
        Connection connection = BaseRepository.getConnection();
        ArrayList<RoleDto> arraylist = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareStatement(DISPLAYFAILURE);
        preparedStatement.setString(1, startDate);
        preparedStatement.setString(2, endDate);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int bookingId = resultSet.getInt("booking_id");
            String tourName = resultSet.getString("tour_name");
            String bookingDate = resultSet.getString("booking_date");
            String startDatee = resultSet.getString("start_date");
            String endDatee = resultSet.getString("end_date");
            double tourSumPrice = resultSet.getDouble("total_price");
            DecimalFormat decimalFormat = new DecimalFormat("#,##0");
            String formattedNumber = decimalFormat.format(tourSumPrice);
            String customerName = resultSet.getString("customer_name");
            arraylist.add(new RoleDto(bookingId, tourName, bookingDate, startDatee, endDatee, formattedNumber, customerName));
        }
        return arraylist;
    }

    @Override
    public List<RoleDto> displayChart(int month, int year) throws SQLException {
        Connection connection = BaseRepository.getConnection();
        ArrayList<RoleDto> arraylist = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareStatement(DISPLAYROLE);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int bookingId = resultSet.getInt("booking_id");
            String tourName = resultSet.getString("tour_name");
            String bookingDate = resultSet.getString("booking_date");
            String startDate = resultSet.getString("start_date");
            String endDate = resultSet.getString("end_date");
            double tourSumPrice = resultSet.getDouble("total_price");
            DecimalFormat decimalFormat = new DecimalFormat("#,##0");
            String formattedNumber = decimalFormat.format(tourSumPrice);
            String customerName = resultSet.getString("customer_name");
            arraylist.add(new RoleDto(bookingId, tourName, bookingDate, startDate, endDate, formattedNumber, customerName));
        }
        return arraylist;
    }

    @Override
    public List<TourEmailDto> displayEmail(int customerId) throws SQLException {
        Connection connection = BaseRepository.getConnection();
        ArrayList<TourEmailDto> arraylist = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareStatement(DISPLAYEMAIL);
        preparedStatement.setInt(1, customerId);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            String tourName = resultSet.getString("tour_name");
            String startDate = resultSet.getString("start_date");
            String endDate = resultSet.getString("end_date");
            int time = resultSet.getInt("date_range");
            int quantity = resultSet.getInt("quantity");
            String customerName = resultSet.getString("employee_name");
            String customerPhone = resultSet.getString("employee_phone");
            double tourSumPrice = resultSet.getDouble("total_amount");
            DecimalFormat decimalFormat = new DecimalFormat("#,##0");
            String email = resultSet.getString("customer_email");
            String formattedNumber = decimalFormat.format(tourSumPrice);
            arraylist.add(new TourEmailDto(tourName, startDate, endDate, time, quantity, customerName, customerPhone, formattedNumber,email));
        }
        return arraylist;
    }

    @Override
    public void quantityList(int id) throws SQLException {
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(QUANTITYLIST);
        preparedStatement.setInt(1, id);
        preparedStatement.executeUpdate();
    }


}
