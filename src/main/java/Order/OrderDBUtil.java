package Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OrderDBUtil {
	
	//Insert
    public static boolean insertOrder(Order order) {
        boolean isSuccess = false;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO `order` (title, name, age, gender, phone, email, address, image, comments) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, order.getTitle());
            ps.setString(2, order.getName());
            ps.setString(3, order.getAge());
            ps.setString(4, order.getGender());
            ps.setString(5, order.getPhone());
            ps.setString(6, order.getEmail());
            ps.setString(7, order.getAddress());
            ps.setBytes(8, order.getImage());
            ps.setString(9, order.getComments());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                isSuccess = true;
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
    
 // Get Order by ID
    public static Order getOrderById(int id) {
        Order order = null;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM `order` WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                order = new Order(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("name"),
                    rs.getString("age"),
                    rs.getString("gender"),
                    rs.getString("phone"),
                    rs.getString("email"),
                    rs.getString("address"),
                    rs.getBytes("image"),
                    rs.getString("comments")
                );
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return order;
    }

    // Update Order
    public static boolean updateOrder(Order order) {
        boolean isSuccess = false;

        try {
            Connection con = DBConnection.getConnection();
            String sql = (order.getImage() != null) ?
                "UPDATE `order` SET title=?, name=?, age=?, gender=?, phone=?, email=?, address=?, image=?, comments=? WHERE id=?" :
                "UPDATE `order` SET title=?, name=?, age=?, gender=?, phone=?, email=?, address=?, comments=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, order.getTitle());
            ps.setString(2, order.getName());
            ps.setString(3, order.getAge());
            ps.setString(4, order.getGender());
            ps.setString(5, order.getPhone());
            ps.setString(6, order.getEmail());
            ps.setString(7, order.getAddress());

            int index = 8;
            if (order.getImage() != null) {
                ps.setBytes(index++, order.getImage());
            }
            ps.setString(index++, order.getComments());
            ps.setInt(index, order.getId());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                isSuccess = true;
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

        // Delete order by ID
        public static boolean deleteOrderById(int id) {
            boolean isSuccess = false;
            try {
                Connection con = DBConnection.getConnection();
                String sql = "DELETE FROM `order` WHERE id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id);

                int rows = ps.executeUpdate();
                if (rows > 0) {
                    isSuccess = true;
                }

                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return isSuccess;
        }

}
