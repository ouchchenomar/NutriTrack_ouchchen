package ma.ac.esi.nutritrack.model;


import java.util.List;

public class Meal {
    private String name;
    private int mealId;
    private List<Ingredient> ingredients;

    public Meal(String name, List<Ingredient> ingredients,int mealId) {
        this.name = name;
        this.ingredients = ingredients;
        this.mealId = mealId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Ingredient> getIngredients() {
        return ingredients;
    }

    public void setIngredients(List<Ingredient> ingredients) {
        this.ingredients = ingredients;
    }
    public int getMealId() {
        return mealId;
    }
}

