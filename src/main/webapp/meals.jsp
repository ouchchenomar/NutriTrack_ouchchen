<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %> 
<%@ page import="ma.ac.esi.nutritrack.model.Meal" %> 
<%@ page import="ma.ac.esi.nutritrack.model.Ingredient" %> 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Meal Plan - Gain Weight</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body { background-color: #f4f6f9; font-family: Arial, sans-serif; }
    .sidebar { height: 100vh; background-color: #343a40; color: white; padding-top: 20px; }
    .sidebar a { color: white; display: block; padding: 15px; text-decoration: none; text-align: center; transition: 0.3s; }
    .sidebar a:hover { background-color: #495057; border-radius: 10px; }
    .meal-card { border-radius: 15px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); background: white; padding: 15px; margin-bottom: 20px; }
    .kcal-box { background-color: #ffffff; padding: 20px; border-radius: 15px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); text-align: center; }
    .meal-item { border-radius: 10px; background-color: #ffffff; padding: 15px; margin-bottom: 10px; text-align: center; box-shadow: 0 2px 5px rgba(0,0,0,0.1); transition: transform 0.3s; }
    .meal-item:hover { transform: scale(1.05); }
    .meal-item img { width: 50px; height: 50px; display: block; margin: 0 auto 10px; border-radius: 50%; }
    .progress { height: 10px; border-radius: 5px; }
    .user-info { display: flex; align-items: center; margin-bottom: 20px; }
    .user-info i { font-size: 24px; margin-right: 10px; }
    .logout-btn { background: none; border: none; color: #dc3545; display: flex; align-items: center; }
    .logout-btn i { margin-right: 5px; }
  </style>
</head>
<body>
  <div class="container-fluid">
    <div class="row">
      <!-- Sidebar -->
      <div class="col-md-2 sidebar d-flex flex-column align-items-center">
        <a href="#"><i class="bi bi-grid"></i></a>
        <a href="#"><i class="bi bi-search"></i></a>
        <a href="#"><i class="bi bi-people"></i></a>
        <a href="#"><i class="bi bi-star"></i></a>
        <a href="#"><i class="bi bi-calendar"></i></a>
        <a href="#"><i class="bi bi-check-square"></i></a>
        <a href="#"><i class="bi bi-chat"></i></a>
        <a href="#"><i class="bi bi-envelope"></i></a>
      </div>
      
      <!-- Main Content -->
      <div class="col-md-10 p-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
          <h2><strong>Meal plans</strong> / Gain weight</h2>
          <div class="d-flex align-items-center">
            <div class="user-info me-3"> 
              <i class="bi bi-person-circle"></i> 
              <span><%= session.getAttribute("login") != null ? session.getAttribute("login") : "Utilisateur" %></span> 
            </div> 
            <form action="LogoutController" method="post"> 
              <button type="submit" class="logout-btn"><i class="bi bi-box-arrow-right"></i> Déconnexion</button>
            </form>
          </div>
        </div>
        
        <!-- Bouton Ajouter un ingrédient -->        
        <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addIngredientModal"> 
          <i class="bi bi-plus-lg"></i> Ajouter un ingrédient 
        </button> 

        <div class="row my-4">
          <div class="col-md-6">
            <img src="https://via.placeholder.com/600x300" class="img-fluid rounded" alt="Meal Image">
          </div>
          <div class="col-md-6 kcal-box">
            <h3><strong>823 kcal</strong></h3>
            <div class="progress my-3">
              <div class="progress-bar bg-success" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <p><i class="bi bi-fire"></i> 283 kcal burned</p>
          </div>
        </div>

        <!-- Meal Sections -->
        <div class="row"> 
          <% 
          List<Meal> meals = (List<Meal>) request.getAttribute("meals"); 
          if (meals != null && !meals.isEmpty()) { 
              for (Meal meal : meals) { 
                  int totalCalories = 0; // Initialiser le total des calories pour chaque repas
          %> 
                  <div class="col-md-3 meal-card"> 
                      <h5 class="text-center"><%= meal.getName() %></h5> 
                      <% for (Ingredient ing : meal.getIngredients()) { 
                          totalCalories += ing.getCalories(); // Ajouter les calories de chaque ingrédient
                      %> 
                          <div class="meal-item"> 
                              <img src="img/<%= ing.getName().replaceAll(" ", "") %>.jpg" alt="<%= ing.getName() %>"> 
                              <%= ing.getName() %><br> 
                              <small><%= ing.getCalories() %> kcal</small>
                              
                              <!-- Icônes Modifier et Supprimer -->
                              <div class="d-flex justify-content-between mt-2">
                                  <!-- Icône Modifier -->
                                  <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editIngredientModal" data-id="<%= ing.getId() %>" data-name="<%= ing.getName() %>" data-calories="<%= ing.getCalories() %>">
                                      <i class="bi bi-pencil"></i>
                                  </button>
                                  <!-- Icône Supprimer -->
                                  <button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteIngredientModal" data-id="<%= ing.getId() %>" data-name="<%= ing.getName() %>">
                                      <i class="bi bi-trash"></i>
                                  </button>
                              </div>
                          </div> 
                      <% } %> 
                      <!-- Affichage du total des calories pour ce repas -->
                      <p class="text-center mt-2"><strong>Total : <%= totalCalories %> kcal</strong></p>
                  </div> 
          <% 
              }  
          } else { 
          %> 
          <p class="text-center text-muted">Aucun repas disponible.</p> 
          <% } %> 
        </div>

        <!-- Fenêtre modale pour ajouter un ingrédient -->
        <div class="modal fade" id="addIngredientModal" tabindex="-1" aria-labelledby="addIngredientModalLabel" aria-hidden="true"> 
          <div class="modal-dialog"> 
            <div class="modal-content"> 
              <div class="modal-header"> 
                <h5 class="modal-title" id="addIngredientModalLabel">Ajouter un nouvel ingrédient</h5> 
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
              </div> 
              <div class="modal-body"> 
                <form action="IngredientController" method="post"> 
                  <input type="hidden" name="action" value="add">
                  <div class="mb-3"> 
                    <label class="form-label">Repas</label> 
                    <select class="form-control" id="mealId" name="mealId" required> 
                      <% 
                      if (meals != null && !meals.isEmpty()) { 
                          for (Meal meal : meals) { 
                      %>
                              <option value="<%= meal.getMealId() %>"><%= meal.getName() %></option> 
                      <% 
                          } 
                      } 
                      %> 
                    </select> 
                  </div> 
                  <div class="mb-3"> 
                    <label class="form-label">Nom de l'ingrédient</label> 
                    <input type="text" class="form-control" id="ingredientName" name="name" required> 
                  </div> 
                  <div class="mb-3"> 
                    <label class="form-label">Calories</label> 
                    <input type="number" class="form-control" id="ingredientCalories" name="calories" required> 
                  </div> 
                  <button type="submit" class="btn btn-success">Ajouter</button> 
                </form> 
              </div> 
            </div> 
          </div> 
        </div> 
        
        <!-- Fenêtre modale pour modifier un ingrédient -->
        <div class="modal fade" id="editIngredientModal" tabindex="-1" aria-labelledby="editIngredientModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editIngredientModalLabel">Modifier un ingrédient</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="IngredientController" method="post">
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" id="editIngredientId" name="id">
                            <div class="mb-3">
                                <label class="form-label">Nom de l'ingrédient</label>
                                <input type="text" class="form-control" id="editIngredientName" name="name" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Calories</label>
                                <input type="number" class="form-control" id="editIngredientCalories" name="calories" required>
                            </div>
                            <button type="submit" class="btn btn-success">Sauvegarder</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Fenêtre modale pour confirmer la suppression -->
        <div class="modal fade" id="deleteIngredientModal" tabindex="-1" aria-labelledby="deleteIngredientModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteIngredientModalLabel">Confirmer la suppression</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Êtes-vous sûr de vouloir supprimer cet ingrédient : <span id="ingredientToDelete"></span> ?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                        <form action="IngredientController" method="post">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" id="deleteIngredientId" name="id">
                            <button type="submit" class="btn btn-danger">Supprimer</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    // Pré-remplir les champs de la fenêtre modale de modification avec les informations de l'ingrédient
    var editModal = document.getElementById('editIngredientModal');
    editModal.addEventListener('show.bs.modal', function(event) {
        var button = event.relatedTarget; // Bouton qui a déclenché l'événement
        var ingredientId = button.getAttribute('data-id');
        var ingredientName = button.getAttribute('data-name');
        var ingredientCalories = button.getAttribute('data-calories');

        // Remplir les champs de la modal
        document.getElementById('editIngredientId').value = ingredientId;
        document.getElementById('editIngredientName').value = ingredientName;
        document.getElementById('editIngredientCalories').value = ingredientCalories;
    });

    // Pré-remplir la fenêtre modale de suppression avec le nom de l'ingrédient
    var deleteModal = document.getElementById('deleteIngredientModal');
    deleteModal.addEventListener('show.bs.modal', function(event) {
        var button = event.relatedTarget;
        var ingredientId = button.getAttribute('data-id');
        var ingredientName = button.getAttribute('data-name');

        // Afficher le nom de l'ingrédient dans le modal
        document.getElementById('ingredientToDelete').textContent = ingredientName;
        document.getElementById('deleteIngredientId').value = ingredientId;
    });
  </script>
</body>
</html>