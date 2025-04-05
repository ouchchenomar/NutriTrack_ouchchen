package ma.ac.esi.nutritrack.controller;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.ac.esi.nutritrack.service.IngredientService;

import java.io.IOException;

@WebServlet("/IngredientController")
public class IngredientController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les paramètres de la requête
        int mealId = Integer.parseInt(request.getParameter("mealId"));
        String ingredientName = request.getParameter("name");
        int calories = Integer.parseInt(request.getParameter("calories"));

        // Instancier IngredientService
        IngredientService ingredientService = new IngredientService();

        // Appeler la méthode pour ajouter l'ingrédient
        boolean success = ingredientService.addIngredientToMeal(mealId, ingredientName, calories);

        // Rediriger en fonction du résultat
        if (success) {
            // Rediriger vers MealController en cas de succès
            response.sendRedirect("MealController");
        } else {
            // Afficher une page d'erreur en cas d'échec
            request.setAttribute("errorMessage", "Échec de l'ajout de l'ingrédient.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}