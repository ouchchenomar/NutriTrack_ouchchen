package ma.ac.esi.nutritrack.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet("/LogoutController")
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération de la session
        HttpSession session = request.getSession(false);
        
        // Vérification si la session existe
        if (session != null) {
            // Invalidation de la session (destruction)
            session.invalidate();
        }
        
        // Redirection vers la page index.html
        response.sendRedirect("index.html");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Traitement identique pour les requêtes POST
        doGet(request, response);
    }
}
