package ma.ac.esi.nutritrack.repository;

import ma.ac.esi.nutritrack.model.Ingredient;
import ma.ac.esi.nutritrack.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class IngredientRepository {

    // Méthode pour ajouter un ingrédient à un repas
    public boolean addIngredientToMeal(int mealId, Ingredient ingredient) {
        // Requête SQL pour insérer un nouvel ingrédient
        String sql = "INSERT INTO ingredients (meal_id, name, calories) VALUES (?, ?, ?)";

        try (Connection conn = DBUtil.getConnection(); // Obtenir une connexion à la base de données
             PreparedStatement pstmt = conn.prepareStatement(sql)) { // Créer une requête préparée

            // Définir les paramètres de la requête
            pstmt.setInt(1, mealId); // mealId
            pstmt.setString(2, ingredient.getName()); // Nom de l'ingrédient
            pstmt.setInt(3, ingredient.getCalories()); // Calories de l'ingrédient

            // Exécuter la requête
            int rowsAffected = pstmt.executeUpdate();

            // Retourner true si l'insertion a réussi
            return rowsAffected > 0;

        } catch (SQLException e) {
            // Gérer les erreurs SQL
            e.printStackTrace();
            return false;
        }
    }
}