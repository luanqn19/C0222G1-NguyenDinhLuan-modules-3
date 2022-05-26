import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "calculator", urlPatterns = "/display-discount")
public class CalculatorServlet extends javax.servlet.http.HttpServlet {
    protected void doPost (javax.servlet.http.HttpServletRequest request , javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        double listPrice = Integer.parseInt(request.getParameter("list-price"));
        double discountPercent = Integer.parseInt(request.getParameter("discount-percent"));
        double result = listPrice * discountPercent * 0.01;
        double priceAfterDiscount = listPrice - result;

        request.setAttribute("priceAfter", priceAfterDiscount);
        request.setAttribute("resultAmount", result);
        request.getRequestDispatcher("display.jsp").forward(request, response);
    }

    protected void doGet (javax.servlet.http.HttpServletRequest request , javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
//        PrintWriter printWriter = response.getWriter();
//        printWriter.println("<p>" + "Total: " + "</p>");
    }
}
