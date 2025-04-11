<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %> 
<%@ page import="ma.ac.esi.nutritrack.model.Meal" %> 
<%@ page import="ma.ac.esi.nutritrack.model.Ingredient" %> 
<!DOCTYPE html>
<<<<<<< HEAD
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NutriTrack - Votre Plan Nutritionnel Personnalisé</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    :root {
      --primary: #4CAF50;
      --primary-light: #A5D6A7;
      --primary-dark: #2E7D32;
      --secondary: #FF5722;
      --dark: #263238;
      --light: #ECEFF1;
      --light-text: #78909C;
      --background: #f8f9fa;
      --card-shadow: 0 10px 20px rgba(0,0,0,0.1);
      --transition: all 0.3s ease;
    }
    
    body {
      background-color: var(--background);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      color: var(--dark);
    }
    
    /* Header & Navigation */
    .main-header {
      background-image: linear-gradient(to right, var(--primary), var(--primary-dark));
      color: white;
      border-radius: 0 0 20px 20px;
      box-shadow: var(--card-shadow);
      padding: 20px 0;
      margin-bottom: 30px;
    }
    
    .sidebar {
      background: white;
      border-radius: 20px;
      box-shadow: var(--card-shadow);
      height: calc(100vh - 100px);
      position: sticky;
      top: 20px;
      transition: var(--transition);
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 30px 10px;
      overflow-y: auto;
    }
    
    .nav-link {
      color: var(--light-text);
      border-radius: 12px;
      margin: 5px 0;
      padding: 12px;
      width: 100%;
      text-align: center;
      transition: var(--transition);
      display: flex;
      align-items: center;
      justify-content: center;
    }
    
    .nav-link i {
      font-size: 1.5rem;
      margin-right: 10px;
    }
    
    .nav-link:hover, .nav-link.active {
      background-color: var(--primary-light);
      color: var(--primary-dark);
      transform: translateY(-3px);
    }
    
    .profile-section {
      margin-top: auto;
      width: 100%;
      padding: 15px;
      border-top: 1px solid #eee;
    }
    
    .user-avatar {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      background-color: var(--primary-light);
      color: var(--primary-dark);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.5rem;
      margin-right: 10px;
    }
    
    .logout-btn {
      background: transparent;
      border: none;
      color: var(--light-text);
      font-size: 0.9rem;
      padding: 5px 10px;
      border-radius: 8px;
      transition: var(--transition);
    }
    
    .logout-btn:hover {
      background-color: #ffebee;
      color: #f44336;
    }
    
    /* Dashboard Components */
    .dashboard-title {
      font-size: 1.8rem;
      font-weight: 700;
      margin-bottom: 20px;
      position: relative;
      display: inline-block;
    }
    
    .dashboard-title::after {
      content: '';
      position: absolute;
      bottom: -8px;
      left: 0;
      height: 4px;
      width: 60px;
      background-color: var(--secondary);
      border-radius: 2px;
    }
    
    .stats-card {
      background: white;
      border-radius: 20px;
      padding: 25px;
      box-shadow: var(--card-shadow);
      text-align: center;
      transition: var(--transition);
      height: 100%;
      overflow: hidden;
      position: relative;
    }
    
    .stats-card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 5px;
      background-color: var(--primary);
    }
    
    .stats-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 30px rgba(0,0,0,0.15);
    }
    
    .stats-value {
      font-size: 2.5rem;
      font-weight: 700;
      color: var(--primary-dark);
      margin: 15px 0;
    }
    
    .progress-circular {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      background: conic-gradient(var(--primary) 60%, #e0e0e0 0);
      margin: 0 auto 20px;
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
    }
    
    .progress-circular::before {
      content: '';
      position: absolute;
      width: 80px;
      height: 80px;
      border-radius: 50%;
      background-color: white;
    }
    
    .progress-value {
      position: relative;
      z-index: 2;
      font-size: 1.5rem;
      font-weight: 600;
      color: var(--primary-dark);
    }
    
    /* Meal Cards */
    .meal-section {
      margin-top: 40px;
    }
    
    .meal-card {
      background: white;
      border-radius: 20px;
      padding: 20px;
      box-shadow: var(--card-shadow);
      transition: var(--transition);
      margin-bottom: 30px;
      position: relative;
      overflow: hidden;
    }
    
    .meal-card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 5px;
      height: 100%;
      background-color: var(--secondary);
      transition: var(--transition);
    }
    
    .meal-card:hover::before {
      width: 10px;
    }
    
    .meal-title {
      font-size: 1.3rem;
      font-weight: 600;
      margin-bottom: 15px;
      padding-bottom: 10px;
      border-bottom: 1px solid #f0f0f0;
      color: var(--dark);
    }
    
    .meal-item {
      background-color: var(--light);
      border-radius: 15px;
      padding: 15px;
      margin-bottom: 10px;
      transition: var(--transition);
      display: flex;
      align-items: center;
    }
    
    .meal-item:hover {
      transform: translateX(5px);
      background-color: #e8f5e9;
    }
    
    .meal-item-img {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 15px;
      border: 3px solid white;
      box-shadow: 0 3px 10px rgba(0,0,0,0.1);
    }
    
    .meal-item-info {
      flex: 1;
    }
    
    .meal-item-name {
      font-weight: 600;
      margin-bottom: 5px;
    }
    
    .meal-item-calories {
      font-size: 0.9rem;
      color: var(--light-text);
    }
    
    .meal-item-actions {
      display: flex;
      gap: 5px;
    }
    
    .action-btn {
      background: transparent;
      border: none;
      width: 35px;
      height: 35px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: var(--transition);
    }
    
    .action-btn.edit {
      color: #fb8c00;
    }
    
    .action-btn.delete {
      color: #e53935;
    }
    
    .action-btn:hover {
      background-color: rgba(0,0,0,0.1);
      transform: scale(1.1);
    }
    
    .meal-total {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 20px;
      padding-top: 15px;
      border-top: 1px solid #f0f0f0;
      font-weight: 600;
    }
    
    .calorie-badge {
      background-color: var(--primary-light);
      color: var(--primary-dark);
      padding: 5px 15px;
      border-radius: 15px;
      font-size: 0.9rem;
    }
    
    /* Add Button */
    .add-button {
      background-color: var(--primary);
      color: white;
      border: none;
      border-radius: 12px;
      padding: 12px 25px;
      font-weight: 600;
      transition: var(--transition);
      display: flex;
      align-items: center;
      gap: 10px;
      box-shadow: 0 4px 15px rgba(76, 175, 80, 0.4);
    }
    
    .add-button:hover {
      background-color: var(--primary-dark);
      transform: translateY(-3px);
      box-shadow: 0 8px 20px rgba(76, 175, 80, 0.5);
    }
    
    /* Modal Styles */
    .modal-content {
      border-radius: 20px;
      border: none;
    }
    
    .modal-header {
      background-color: var(--primary);
      color: white;
      border-radius: 20px 20px 0 0;
      border: none;
    }
    
    .form-control, .form-select {
      border-radius: 10px;
      padding: 12px;
      border: 1px solid #e0e0e0;
      transition: var(--transition);
    }
    
    .form-control:focus, .form-select:focus {
      border-color: var(--primary);
      box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.2);
    }
    
    .modal-footer .btn {
      border-radius: 10px;
      padding: 10px 20px;
    }
    
    /* Mobile Responsiveness */
    @media (max-width: 992px) {
      .sidebar {
        position: fixed;
        bottom: 0;
        left: 0;
        right: 0;
        top: auto;
        height: 70px;
        flex-direction: row;
        justify-content: space-around;
        z-index: 1000;
        border-radius: 20px 20px 0 0;
      }
      
      .nav-link {
        flex-direction: column;
        margin: 0 5px;
        padding: 8px;
        width: auto;
      }
      
      .nav-link i {
        margin-right: 0;
        margin-bottom: 5px;
        font-size: 1.2rem;
      }
      
      .profile-section {
        display: none;
      }
      
      .content-wrapper {
        margin-bottom: 80px;
      }
    }
  </style>
</head>
<body>
  <div class="container-fluid px-0">
    <header class="main-header py-4">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h1 class="m-0">NutriTrack</h1>
          <div class="d-flex align-items-center">
            <div class="user-avatar">
              <i class="bi bi-person"></i>
            </div>
            <div>
              <p class="m-0 fw-bold" id="userName"><%= session.getAttribute("login") != null ? session.getAttribute("login") : "Utilisateur" %></p>
              <small>Plan: Gain de poids</small>
            </div>
          </div>
        </div>
      </div>
    </header>
    
    <div class="container content-wrapper">
      <div class="row g-4">
        <!-- Sidebar -->
        <div class="col-lg-2">
          <div class="sidebar">
            <a href="#" class="nav-link active">
              <i class="bi bi-house"></i>
              <span>Accueil</span>
            </a>
            <a href="#" class="nav-link">
              <i class="bi bi-calendar-week"></i>
              <span>Planning</span>
            </a>
            <a href="#" class="nav-link">
              <i class="bi bi-card-list"></i>
              <span>Recettes</span>
            </a>
            <a href="#" class="nav-link">
              <i class="bi bi-graph-up"></i>
              <span>Progrès</span>
            </a>
            <a href="#" class="nav-link">
              <i class="bi bi-gear"></i>
              <span>Paramètres</span>
            </a>
            
            <div class="profile-section mt-auto">
              <div class="d-flex align-items-center mb-3">
                <div class="user-avatar">
                  <i class="bi bi-person"></i>
                </div>
                <div>
                  <p class="m-0 fw-bold" id="userNameSidebar"><%= session.getAttribute("login") != null ? session.getAttribute("login") : "Utilisateur" %></p>
                  <small>Plan: Gain de poids</small>
                </div>
              </div>
              <form action="LogoutController" method="post">
                <button type="submit" class="logout-btn w-100">
                  <i class="bi bi-box-arrow-right"></i> Déconnexion
                </button>
              </form>
            </div>
          </div>
        </div>
        
        <!-- Main Content -->
        <div class="col-lg-10">
          <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="dashboard-title">Plan de repas</h2>
            <button class="add-button" data-bs-toggle="modal" data-bs-target="#addIngredientModal">
              <i class="bi bi-plus-lg"></i>
              <span>Ajouter un ingrédient</span>
            </button>
          </div>
          
          <!-- Stats Cards -->
          <div class="row g-4">
            <div class="col-md-6">
              <div class="stats-card">
                <h5>Calories journalières</h5>
                <div class="progress-circular">
                  <span class="progress-value">60%</span>
                </div>
                <div class="stats-value">823 kcal</div>
                <p class="text-muted">
                  <i class="bi bi-fire"></i> 283 kcal brûlées
                </p>
              </div>
            </div>
            <div class="col-md-6">
              <div class="stats-card">
                <img src="/api/placeholder/400/250" alt="Composition nutritionnelle" class="img-fluid rounded mb-3">
                <div class="row g-2 text-center">
                  <div class="col-4">
                    <div class="p-2 rounded" style="background-color: #e8f5e9;">
                      <h6>Protéines</h6>
                      <p class="m-0">30%</p>
                    </div>
                  </div>
                  <div class="col-4">
                    <div class="p-2 rounded" style="background-color: #fff3e0;">
                      <h6>Glucides</h6>
                      <p class="m-0">50%</p>
                    </div>
                  </div>
                  <div class="col-4">
                    <div class="p-2 rounded" style="background-color: #e1f5fe;">
                      <h6>Lipides</h6>
                      <p class="m-0">20%</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <!-- Meal Sections - Dynamically populated from database -->
          <div class="meal-section">
            <div class="row g-4">
              <% 
              List<Meal> meals = (List<Meal>) request.getAttribute("meals"); 
              if (meals != null && !meals.isEmpty()) { 
                  for (Meal meal : meals) { 
                      int totalCalories = 0; // Initialiser le total des calories pour chaque repas
                      
                      // Définir l'icône appropriée en fonction du nom du repas
                      String mealIcon = "bi-cup-straw"; // Icône par défaut
                      if (meal.getName().toLowerCase().contains("petit") || meal.getName().toLowerCase().contains("déjeuner")) {
                          mealIcon = "bi-sun";
                      } else if (meal.getName().toLowerCase().contains("déjeuner")) {
                          mealIcon = "bi-brightness-high";
                      } else if (meal.getName().toLowerCase().contains("dîner")) {
                          mealIcon = "bi-moon";
                      }
              %>
                  <div class="col-md-6 col-lg-3">
                      <div class="meal-card">
                          <h3 class="meal-title">
                              <i class="bi <%= mealIcon %>"></i> <%= meal.getName() %>
                          </h3>
                          
                          <% 
                          for (Ingredient ing : meal.getIngredients()) { 
                              totalCalories += ing.getCalories(); // Ajouter les calories de chaque ingrédient
                          %>
                              <div class="meal-item">
                                  <img src="/api/placeholder/120/120" alt="<%= ing.getName() %>" class="meal-item-img">
                                  <div class="meal-item-info">
                                      <div class="meal-item-name"><%= ing.getName() %></div>
                                      <div class="meal-item-calories"><%= ing.getCalories() %> kcal</div>
                                  </div>
                                  <div class="meal-item-actions">
                                      <button class="action-btn edit" data-bs-toggle="modal" data-bs-target="#editIngredientModal" 
                                              data-id="<%= ing.getId() %>" data-name="<%= ing.getName() %>" data-calories="<%= ing.getCalories() %>">
                                          <i class="bi bi-pencil"></i>
                                      </button>
                                      <button class="action-btn delete" data-bs-toggle="modal" data-bs-target="#deleteIngredientModal" 
                                              data-id="<%= ing.getId() %>" data-name="<%= ing.getName() %>">
                                          <i class="bi bi-trash"></i>
                                      </button>
                                  </div>
                              </div>
                          <% } %>
                          
                          <!-- Affichage du total des calories pour ce repas -->
                          <div class="meal-total">
                              <span>Total</span>
                              <span class="calorie-badge"><%= totalCalories %> kcal</span>
                          </div>
                      </div>
                  </div>
              <% 
                  }  
              } else { 
              %>
                  <!-- Message si aucun repas disponible -->
                  <div class="col-12">
                      <div class="alert alert-info text-center">
                          <i class="bi bi-info-circle me-2"></i>
                          Aucun repas disponible. Commencez par ajouter des repas à votre plan nutritionnel.
                      </div>
                  </div>
              <% } %>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Add Ingredient Modal -->
  <div class="modal fade" id="addIngredientModal" tabindex="-1" aria-labelledby="addIngredientModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
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
              <select class="form-select" id="mealId" name="mealId" required>
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
            <div class="text-end">
              <button type="button" class="btn btn-outline-secondary me-2" data-bs-dismiss="modal">Annuler</button>
              <button type="submit" class="btn btn-success">Ajouter</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Edit Ingredient Modal -->
  <div class="modal fade" id="editIngredientModal" tabindex="-1" aria-labelledby="editIngredientModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="editIngredientModalLabel">Modifier un ingrédient</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form action="IngredientController" method="post">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" id="editIngredientId" name="id" value="">
            <div class="mb-3">
              <label class="form-label">Nom de l'ingrédient</label>
              <input type="text" class="form-control" id="editIngredientName" name="name" required>
            </div>
            <div class="mb-3">
              <label class="form-label">Calories</label>
              <input type="number" class="form-control" id="editIngredientCalories" name="calories" required>
            </div>
            <div class="text-end">
              <button type="button" class="btn btn-outline-secondary me-2" data-bs-dismiss="modal">Annuler</button>
              <button type="submit" class="btn btn-warning">Modifier</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Delete Confirmation Modal -->
  <div class="modal fade" id="deleteIngredientModal" tabindex="-1" aria-labelledby="deleteIngredientModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="deleteIngredientModalLabel">Confirmer la suppression</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>Êtes-vous sûr de vouloir supprimer <strong id="ingredientToDelete"></strong> ?</p>
          <form action="IngredientController" method="post">
            <input type="hidden" name="action" value="delete">
            <input type="hidden" id="deleteIngredientId" name="id" value="">
            <div class="text-end">
              <button type="button" class="btn btn-outline-secondary me-2" data-bs-dismiss="modal">Annuler</button>
              <button type="submit" class="btn btn-danger">Supprimer</button>
            </div>
          </form>
        </div>
=======
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

>>>>>>> c05ece2dad51f0fedb55666d2b29632ff929b3fe
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
<<<<<<< HEAD
    // Script pour les fonctionnalités d'ajout/modification/suppression
    document.addEventListener('DOMContentLoaded', function() {
      // Synchroniser le nom d'utilisateur dans le header et la sidebar
      const userName = document.getElementById('userName').textContent;
      if (document.getElementById('userNameSidebar')) {
        document.getElementById('userNameSidebar').textContent = userName;
      }
      
      // Gestion du modal d'édition
      const editModal = document.getElementById('editIngredientModal');
      if (editModal) {
        editModal.addEventListener('show.bs.modal', function(event) {
          const button = event.relatedTarget;
          const id = button.getAttribute('data-id');
          const name = button.getAttribute('data-name');
          const calories = button.getAttribute('data-calories');
          
          // Mettre à jour les champs du formulaire
          document.getElementById('editIngredientId').value = id;
          document.getElementById('editIngredientName').value = name;
          document.getElementById('editIngredientCalories').value = calories;
        });
      }
      
      // Gestion du modal de suppression
      const deleteModal = document.getElementById('deleteIngredientModal');
      if (deleteModal) {
        deleteModal.addEventListener('show.bs.modal', function(event) {
          const button = event.relatedTarget;
          const id = button.getAttribute('data-id');
          const name = button.getAttribute('data-name');
          
          // Mettre à jour le texte de confirmation et l'ID
          document.getElementById('ingredientToDelete').textContent = name;
          document.getElementById('deleteIngredientId').value = id;
        });
      }
=======
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
>>>>>>> c05ece2dad51f0fedb55666d2b29632ff929b3fe
    });
  </script>
</body>
</html>