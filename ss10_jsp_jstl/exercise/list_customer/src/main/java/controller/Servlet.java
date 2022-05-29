package controller;

import model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controller.Servlet", urlPatterns = "/customer-list")
public class Servlet extends HttpServlet {
    protected void doPost (HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        Customer[] list = new Customer[5];
        list[0] = (new Customer("Mai Van Hoan" , "1983-08-20" , "Ha Noi" , "image\\img1.jpg"));
        list[1] = (new Customer("Nguyen Van Nam" , "1983-08-21" , "Bac Giang" , "image\\img2.jpg"));
        list[2] = (new Customer("Nguyen Thai Hoa" , "1983-09-25" , "Ha Noi" , "image\\img3.jpg"));
        list[3] = (new Customer("Tran Dang Khoa" , "1990-10-21" , "Ho Chi Minh" , "image\\img4.jpg"));
        list[4] = (new Customer("Nguyen Dinh Thi" , "1995-12-12" , "Da Nang" , "image\\img5.jpg"));

        request.setAttribute("listCustomer" , list);
        request.getRequestDispatcher("index.jsp").forward(request , response);
    }

    protected void doGet (HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        doPost(request , response);
    }
}
