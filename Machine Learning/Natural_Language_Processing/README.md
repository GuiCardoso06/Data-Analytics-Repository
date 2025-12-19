# Question Answering using Natural Language Processing

This project was developed within the scope of the **Natural Language Processing (NLP)** course and focuses on the design and implementation of different approaches to the **Question Answering (QA)** task, culminating in a prototype of an informational chatbot.

The system answers questions related to **hotels, restaurants, and attractions in Coimbra**, using the **MultiWOZpt** dataset.

---

## 🎯 Project Objectives

- Implement a **rule-based Question Answering** system
- Develop QA solutions based on **Machine Learning**
- Apply **unsupervised learning techniques** to textual data
- Explore **Deep Learning models**, specifically **BERT**
- Build a functional **information chatbot**

---

## 📊 Dataset

The project uses the **MultiWOZpt** dataset, which contains structured information about Coimbra:

- `ATTRACTIONSCOIMBRA_DB.json`
- `HOTELSCOIMBRA_DB.json`
- `RESTAURANTSCOIMBRA_DB.json`
- `DIALOGOSCOIMBRA.json`
- `TRAINSCOIMBRA_DB.json` (incomplete)

The data was loaded and processed using **pandas**.

---

## 🧠 Project Structure

The project is divided into **three main milestones**:

---

### 🔹 Milestone 1 — Rule-Based Question Answering

- Named Entity Recognition
- N-gram extraction
- Grammatical feature extraction
- Automatic translation to Portuguese
- Rule-based answer prediction
- Evaluation metrics:
  - Exact Match
  - F1-score
  - Cosine Similarity

📉 Results show limited performance, highlighting the constraints of purely rule-based approaches.

---

### 🔹 Milestone 2 — Machine Learning-Based Question Answering

- Text normalization and cleaning
- Keyword extraction
- Vectorization techniques:
  - TF-IDF
  - GloVe
- Question clustering:
  - K-Means (using the Elbow method)
  - DBSCAN
- Answer prediction per cluster
- Evaluation metrics:
  - Silhouette Score
  - Calinski–Harabasz Index
  - Confusion Matrix

This milestone focuses on **unsupervised Machine Learning applied to NLP**.

---

### 🔹 Milestone 3 — Deep Learning Chatbot with BERT

- Statistical analysis of questions and answers
- WordCloud visualization
- Train/test split (80/20)
- Tokenization using BERT
- Training a **BERT-based Question Answering model**
- Keyword indexing
- Relevant context retrieval
- Interactive Question & Answer interface

This stage introduces **Transformers and Deep Learning** into the system.

---

## 🛠️ Technologies Used

- **Python**
- `pandas`, `numpy`
- `nltk`
- `scikit-learn`
- `matplotlib`
- `googletrans`
- `transformers` (Hugging Face)
- `PyTorch`
- **BERT**
