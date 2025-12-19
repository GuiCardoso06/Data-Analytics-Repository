# Road Accident Severity Classification

## 📌 Overview
This project focuses on predicting the severity of road traffic accidents using Machine Learning techniques.  
The objective is to analyze accident-related data and build classification models capable of identifying the level of injury resulting from an accident.

Two classification scenarios were explored:
- **Binary classification**: Slight Injury vs. Serious/Fatal Injury  
- **Multiclass classification**: Slight Injury, Serious Injury, and Fatal Injury  

---

## 🎯 Objectives
- Understand the factors that influence accident severity  
- Compare the performance of different Machine Learning models  
- Evaluate the impact of class imbalance and feature selection on model performance  

---

## 📊 Dataset
The dataset contains information on **12,316 road traffic accidents**, including:
- Driver characteristics (age group, gender, driving experience, education level)
- Vehicle information (type, ownership, years of service)
- Accident context (location, collision type, pedestrian movement)
- Number of vehicles involved and casualties
- Injury severity outcomes

The data includes multiple categorical variables and missing values.

---

## 🧹 Data Preprocessing
Key preprocessing steps included:
- Conversion of categorical variables to numerical representations
- Handling missing values:
  - Median imputation for driving experience
  - Mode imputation for accident area, vehicle type, and collision type
- Feature scaling and standardization
- Train-test split for model evaluation
- Experiments with both **original (imbalanced)** and **balanced** datasets

---

## 🔍 Feature Selection
Seven features were selected based on their relevance to injury severity:
- Driver age band
- Driving experience
- Number of vehicles involved
- Number of casualties
- Type of collision
- Type of vehicle
- Area where the accident occurred

Additional experiments were conducted using fewer features to analyze performance trade-offs.

---

## 🤖 Models Implemented
The following Machine Learning models were developed and evaluated:

- **Support Vector Machine (SVM)**  
  - Hyperparameter tuning using RandomizedSearchCV  
  - Evaluation using weighted F1-score  

- **Neural Networks (Automatic Model)**  
  - Multi-layer Perceptron (MLP) using `sklearn`  
  - Comparison between binary and multiclass scenarios  

- **Neural Networks (Manual Implementation)**  
  - Custom neural network built from scratch  
  - Forward propagation and backpropagation  

- **Random Forest**  
  - Separate models for binary and multiclass classification  
  - Robust evaluation across balanced and unbalanced datasets  

---

## 📈 Results Summary
- Models consistently performed better on **unbalanced datasets**, especially for the majority class (*Slight Injury*)
- Simplifying the problem from multiclass to binary classification improved overall performance
- Class balancing often reduced model generalization, particularly for Neural Networks
- Random Forest and SVM showed the most robust results across scenarios
- Reducing the number of features improved execution time but did not significantly enhance predictive performance

---

## 🛠 Tools & Technologies
- Python  
- scikit-learn  
- NumPy  
- Pandas  
- Matplotlib / Seaborn  

---

## 📌 Notes
This project was developed for academic purposes and uses public or anonymized data.  
The focus was on methodological comparison, model evaluation, and analytical reasoning rather than deployment.

---

## 👥 Authors
- Guilherme Cardoso  
