# Nutrition Track

## Description
Nutrition Track est une application Java EE qui permet aux utilisateurs de suivre leur alimentation quotidienne. Les utilisateurs peuvent ajouter, modifier et supprimer des repas ainsi que leurs calories associées.

## Fonctionnalités

- **Gestion des repas** : Ajout, modification et suppression de repas
- **Suivi des calories** : Calcul automatique des calories totales par jour
- **Interface utilisateur intuitive** : Navigation simple pour une expérience utilisateur optimale

## Technologies utilisées

- Java EE
- JDK 21
- Apache Tomcat 11
- MySQL pour la base de données
- Servlets & JSP
- HTML5, CSS3, JavaScript (frontend)

## Installation

### Prérequis
- JDK 21
- Apache Tomcat 11
- eclipse
- MySQL

### Étapes d'installation
1. Cloner le dépôt GitHub :
   ```
   git clone https://github.com/votre-utilisateur/nutrition-track.git
   ```

2. Configurer la base de données MySQL :
   - Créer une base de données nommée "nutwise"
   - Mettre à jour les informations de connexion dans le fichier `persistence.xml`

3. Compiler le projet avec eclipse :
   ```
   mvn clean install
   ```

4. Déployer le fichier WAR généré sur votre serveur Tomcat 11

## Structure du projet

```
nutrition-track/
├── src/
│   ├── main/
│   │   ├── java/           # Code source Java
│   │   ├── resources/      # Fichiers de configuration
│   │   └── webapp/         # Fichiers web (JSP, HTML, CSS, JS)
│   └── test/               # Tests unitaires
├── pom.xml                 # Configuration Maven
└── README.md               # Ce fichier
```

## Utilisation

1. Accédez à l'application via : http://localhost:8080/nutrition-track
2. Créez un compte utilisateur ou connectez-vous
3. Ajoutez vos repas quotidiens avec leurs informations nutritionnelles
4. Consultez les statistiques et suivez votre consommation calorique

## Captures d'écran

[Insérer des captures d'écran de l'application ici]

## Configuration de la base de données

### Exemple de configuration MySQL dans persistence.xml
```xml
<persistence-unit name="nutritionTrackPU" transaction-type="JTA">
    <provider>org.hibernate.jpa.HibernatePersistenceProvider</provider>
    <jta-data-source>java:comp/env/jdbc/nutritionTrackDS</jta-data-source>
    <properties>
        <property name="hibernate.dialect" value="org.hibernate.dialect.MySQL8Dialect"/>
        <property name="hibernate.hbm2ddl.auto" value="update"/>
        <property name="hibernate.show_sql" value="true"/>
    </properties>
</persistence-unit>
```

### Exemple de configuration du datasource dans Tomcat (context.xml)
```xml
<Resource name="jdbc/nutritionTrackDS" 
          auth="Container" 
          type="javax.sql.DataSource"
          maxTotal="100" 
          maxIdle="30" 
          maxWaitMillis="10000"
          username="votre_utilisateur" 
          password="votre_mot_de_passe" 
          driverClassName="com.mysql.cj.jdbc.Driver"
          url="jdbc:mysql://localhost:3306/nutritiontrack?serverTimezone=UTC"/>
```

## Développement futur

- Ajout d'un tableau de bord avec statistiques avancées
- Intégration d'une base de données d'aliments prédéfinie
- Application mobile complémentaire

## Contribution

Les contributions sont les bienvenues ! N'hésitez pas à soumettre des pull requests ou à signaler des problèmes.


## Contact

Pour toute question ou suggestion, veuillez contacter [ouchcheno@gmail.com].
