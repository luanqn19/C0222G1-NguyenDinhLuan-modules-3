package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Servlet", urlPatterns = "/calculator")
public class Servlet extends HttpServlet {
    protected void doPost (HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        int number1 = 0;
        int number2 = 0;
        boolean flag;

        do {
            flag = true;
            try {
                number1 = Integer.parseInt(request.getParameter("number1"));
                number2 = Integer.parseInt(request.getParameter("number2"));
            } catch (NumberFormatException e) {
                response.sendRedirect("index.jsp");
                flag = false;
            }
        } while (!flag);

        String operation = request.getParameter("operation");
        int result = 0;

        if (operation.equals("cong")) {
            result = number1 + number2;
            operation = " + ";
        }
        else if (operation.equals("tru")) {
            result = number1 - number2;
            operation = " - ";
        }
        else if (operation.equals("nhan")) {
            result = number1 * number2;
            operation = " * ";
        }
        else {
            result = number1 / number2;
            operation = " / ";
        }

        request.setAttribute("operation", operation);
        request.setAttribute("number1", number1);
        request.setAttribute("number2", number2);
        request.setAttribute("result", result);
        request.getRequestDispatcher("display.jsp").forward(request,response);
    }

    protected void doGet (HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {

    }
}
