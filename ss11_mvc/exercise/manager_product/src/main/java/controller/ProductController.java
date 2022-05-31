package controller;

import model.Product;
import services.InterfaceServices;
import services.impl.ProductServices;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductController extends HttpServlet {
    ProductServices productServices = new ProductServices();

    protected void doPost (HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch ( action ) {
            case "create":
                addNew(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "update":
                break;
            case "detail":
                detailProduct(request, response);
                break;
            case "search":
                searchProduct(request, response);
                break;
            case "display":
            default:
                showListProduct(request, response);
        }
    }

    private void detailProduct (HttpServletRequest request , HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("search id: " + id);

        Product product = productServices.findById(id);
        request.setAttribute("product", product);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/detail.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchProduct (HttpServletRequest request , HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("search id: " + id);

        Product product = productServices.findById(id);
        request.setAttribute("product", product);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/search.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void deleteProduct (HttpServletRequest request , HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        productServices.delete(id);

        request.setAttribute("messenger", "Delete data successful");

        showListProduct(request, response);
    }

    protected void addNew (HttpServletRequest request , HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String code = request.getParameter("code");
        String name = request.getParameter("inputName");
        String date = request.getParameter("date");
        String description = request.getParameter("description");
        String production = request.getParameter("productionName");
        int amount = Integer.parseInt(request.getParameter("amount"));
        double price = Double.parseDouble(request.getParameter("price"));
        Product product = new Product(id, code, name, date, description, production, amount, price);
        productServices.save(product);

        request.setAttribute("messenger", "Add new data successful");

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/form.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet (HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch ( action ) {
            case "create":
                showForm(request, response);
                break;
            case "delete":
                showFormDelete(request, response);
                break;
            case "update":
                showFormUpdate(request, response);
                break;
            case "search":
                showFormSearch(request, response);
                break;
            case "detail":
            case "display":
            default:
                showListProduct(request, response);
        }
    }

    private void showFormSearch (HttpServletRequest request , HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/search.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormUpdate (HttpServletRequest request , HttpServletResponse response) {
        List<Product> productList = productServices.findAll();
        request.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/edit.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormDelete (HttpServletRequest request , HttpServletResponse response) {
        List<Product> productList = productServices.findAll();
        request.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/delete.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void showForm (HttpServletRequest request , HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/form.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    protected void showListProduct (HttpServletRequest request , HttpServletResponse response) {
        List<Product> productList = productServices.findAll();
        request.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/display.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
