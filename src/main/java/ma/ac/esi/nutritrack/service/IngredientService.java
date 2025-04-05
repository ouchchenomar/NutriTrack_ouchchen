package ma.ac.esi.nutritrack.service;

import ma.ac.esi.nutritrack.model.Ingredient;
import ma.ac.esi.nutritrack.repository.IngredientRepository;

public class IngredientService {

    // Référence au repository
    private IngredientRepository ingredientRepository;

    // Constructeur
    public IngredientService() {
        this.ingredientRepository = new IngredientRepository();
    }

    // Méthode pour ajouter un ingrédient à un repas
    public boolean addIngredientToMeal(int mealId, String name, int calories) {
        // Créer un nouvel objet Ingredient
        Ingredient ingredient = new Ingredient(calories, name, calories);

        // Appeler la méthode du repository pour insérer l'ingrédient
        boolean success = ingredientRepository.addIngredientToMeal(mealId, ingredient);

        // Retourner le résultat de l'opération
        return success;
    }
}