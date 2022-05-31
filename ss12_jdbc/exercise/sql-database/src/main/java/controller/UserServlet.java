package controller;

import model.User;
import services.impl.IUserImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    IUserImpl iUserServices = new IUserImpl();

    protected void doPost (HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch ( action ) {
            case "create":
                insertUser(request , response);
                break;
            case "edit":
                updateUser(request , response);
                break;
            case "search":
                searchUser(request, response);
                break;
            case "sort":
                sortUser(request, response);
                break;
        }
    }

    private void sortUser (HttpServletRequest request , HttpServletResponse response) {
        List<User> listUser = null;
        String sortBy = request.getParameter("sortBy");
        System.out.println(sortBy);

        if (sortBy.equals("desc"))
            listUser = iUserServices.sortByNameDesc();
        else if (sortBy.equals("asc"))
            listUser  = iUserServices.sortByNameAsc();

        request.setAttribute("listUser" , listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/sort.jsp");
        try {
            dispatcher.forward(request , response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchUser (HttpServletRequest request , HttpServletResponse response) {
        String country = request.getParameter("country");
        List<User> listUser = iUserServices.findByCountry(country);

        request.setAttribute("listUser" , listUser);
        request.setAttribute("msgNotFound", "Country khong tim thay");
        request.setAttribute("msgFound", "Danh sach users");

        RequestDispatcher dispatcher = request.getRequestDispatcher("views/search.jsp");
        try {
            dispatcher.forward(request , response);
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
                showNewForm(request , response);
                break;
            case "edit":
                showEditForm(request , response);
                break;
            case "delete":
                deleteUser(request , response);
                break;
            case "search":
                showSearchForm(request, response);
                break;
            case "sort":
                showSortForm(request, response);
                break;
            default:
                listUser(request , response);
                break;
        }
    }

    private void showSortForm (HttpServletRequest request , HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/sort.jsp");

        try {
            dispatcher.forward(request , response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showSearchForm (HttpServletRequest request , HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/search.jsp");

        try {
            dispatcher.forward(request , response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listUser (HttpServletRequest request , HttpServletResponse response) {
        List<User> listUser = iUserServices.findAll();
        request.setAttribute("listUser" , listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/list.jsp");
        try {
            dispatcher.forward(request , response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm (HttpServletRequest request , HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/create.jsp");

        try {
            dispatcher.forward(request , response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm (HttpServletRequest request , HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = iUserServices.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/edit.jsp");
        request.setAttribute("user" , existingUser);
        try {
            dispatcher.forward(request , response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void insertUser (HttpServletRequest request , HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User newUser = new User(name , email , country);
        iUserServices.save(newUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/create.jsp");
        try {
            dispatcher.forward(request , response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateUser (HttpServletRequest request , HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User afterEdit = new User(id , name , email , country);

        iUserServices.update(afterEdit);
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/edit.jsp");
        try {
            dispatcher.forward(request , response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteUser (HttpServletRequest request , HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        iUserServices.delete(id);

        List<User> listUser = iUserServices.findAll();

        request.setAttribute("listUser" , listUser);

        RequestDispatcher dispatcher = request.getRequestDispatcher("views/list.jsp");

        try {
            dispatcher.forward(request , response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
