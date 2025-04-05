package ma.ac.esi.nutritrack.service;

import java.util.List;

import ma.ac.esi.nutritrack.model.Meal;
import ma.ac.esi.nutritrack.repository.MealRepository;

public class MealService {
    private MealRepository mealRepository;

    public MealService() {
        this.mealRepository = new MealRepository();
    }

    public List<Meal> getMeals() {
        return mealRepository.getAllMeals();
    }
}