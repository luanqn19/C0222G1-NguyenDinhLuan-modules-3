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
        double number1 = 0;
        double number2 = 0;
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
        String str = calculator(operation, number1, number2);
        double result = Double.parseDouble(str.split(",")[0]);
        operation = str.split(",")[1];

        request.setAttribute("operation", operation);
        request.setAttribute("number1", number1);
        request.setAttribute("number2", number2);
        request.setAttribute("result", result);
        request.getRequestDispatcher("display.jsp").forward(request,response);
    }

    protected String calculator (String operator, double number1, double number2) {
        double result = 0;
        String calc = "";
        if (operator.equals("cong")) {
            result = number1 + number2;
            operator = " + ";
            calc = result + "," + operator;
        }
        else if (operator.equals("tru")) {
            result = number1 - number2;
            operator = " - ";
            calc = result + "," + operator;
        }
        else if (operator.equals("nhan")) {
            result = number1 * number2;
            operator = " * ";
            calc = result + "," + operator;
        }
        else {
            try {
                result = (number1 / number2);
            } catch (ArithmeticException e) {
                e.printStackTrace();
            }
            operator = " / ";
            calc = result + "," + operator;
        }
        return calc;
    }

    protected void doGet (HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {

    }
}
